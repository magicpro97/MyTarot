import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp(functions.config().firebase);

// // Start writing Firebase Functions
// // https://firebase.google.com/docs/functions/typescript
//

export const getAllCards = functions.https.onRequest(async (req, res) => {
    const db = admin.firestore();
    db.collection("tarot").get().then(snapshot => {
        const cards: any[] = [];
        snapshot.forEach(card => cards.push(card.data()));
        res.send(cards);
    }).catch(err => 
        res.send(err)
    );
});
