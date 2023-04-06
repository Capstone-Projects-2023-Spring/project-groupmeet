const functions = require('firebase-functions');
const admin = require('firebase-admin');
admin.initializeApp();

//listener method
exports.sendListenerPushNotification = functions.database.ref('/sendMessage/{userId}/').onWrite((data, context) => {
	const userId = context.params.userId; //get params like this

    const payload = {
        token: FCMToken,
        notification: {
            title: 'cloud function demo',
            body: message
        },
        data: {
            body: message,
        }
    };
    
    admin.messaging().send(payload).then((response) => {
        // Response is a message ID string.
        console.log('Successfully sent message:', response);
        return {success: true};
    }).catch((error) => {
        return {error: error.code};
    });
});
