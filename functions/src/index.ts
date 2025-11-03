import * as functions from 'firebase-functions';
import * as admin from 'firebase-admin';

admin.initializeApp();
const db = admin.firestore();

// Anti-fraud: limit ad rewards by device/day
export const verifyAdReward = functions.https.onCall(async (data, context) => {
  if(!context.auth) throw new functions.https.HttpsError('unauthenticated','Sign in required');
  const uid = context.auth.uid;
  const deviceId = data.deviceId || 'unknown';
  const today = new Date(); today.setHours(0,0,0,0);
  const cap = 20;

  const q = await db.collection('wallet_txns')
    .where('uid','==',uid)
    .where('type','==','ad_reward')
    .where('timestamp','>=',today).get();

  if(q.size >= cap){
    return { ok: false, reason: 'daily_cap_reached' };
  }
  await db.collection('wallet_txns').add({
    uid, type:'ad_reward', amount: data.amount || 1, refId: deviceId, timestamp: admin.firestore.FieldValue.serverTimestamp()
  });
  await db.collection('users').doc(uid).set({ coins: admin.firestore.FieldValue.increment(data.amount || 1) }, { merge: true });
  return { ok: true };
});

// Withdraw request pre-validation
export const createWithdrawRequest = functions.https.onCall( async (data, context) => {
  if(!context.auth) throw new functions.https.HttpsError('unauthenticated','Sign in required');
  const uid = context.auth.uid;
  const { method, number, amount } = data;
  if(amount < 50) throw new functions.https.HttpsError('failed-precondition','Minimum 50 coins');

  await db.collection('withdraw_requests').add({
    uid, method, number, amount, status:'pending', createdAt: admin.firestore.FieldValue.serverTimestamp(), approvedBy: null
  });
  return { ok: true };
});

// Admin approval hook
export const approveWithdraw = functions.https.onCall( async (data, context) => {
  if(!context.auth) throw new functions.https.HttpsError('unauthenticated','Sign in required');
  const role = (context.auth.token as any).role || 'user';
  if(!['superadmin','finance','moderator'].includes(role)) throw new functions.https.HttpsError('permission-denied','Admin role required');

  const { id, approved } = data;
  const ref = db.collection('withdraw_requests').doc(id);
  await ref.update({
    status: approved ? 'approved' : 'rejected',
    approvedBy: context.auth.uid
  });
  await db.collection('admin_logs').add({
    adminUid: context.auth.uid,
    action: approved ? 'approve_withdraw':'reject_withdraw',
    target: id,
    timestamp: admin.firestore.FieldValue.serverTimestamp()
  });
  return { ok: true };
});
