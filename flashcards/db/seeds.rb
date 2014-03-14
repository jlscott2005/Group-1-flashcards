Deck.create( title: "U.S. Capitals")
Card.create( question: "California", answer: "Sacramento", deck_id: 1)
Card.create( question: "Virginia", answer: "Richmond", deck_id: 1)
Card.create( question: "Tunnel", answer: "Secret", deck_id: 1)

Deck.create( title: "Otter trivia")
Card.create( question: "Matt's nickname", answer: "Vanilla Bear", deck_id: 2)
Card.create( question: "Tony Ta's nickname", answer: "Tony Totter the hairy fucking otter!", deck_id: 2)
Card.create( question: "Where do Otters like to play?", answer: "Secret tunnel", deck_id: 2)

User.create(user_name: "VanillaBear", email: "vanilla@bear.com", password: "poop", password_confirmation: "poop")
User.create(user_name: "TonyTotter", email: "totter@bear.com", password: "hairyotter", password_confirmation: "hairyotter")
User.create(user_name: "SecretTunnel", email: "secret@tunnel.com", password: "shhh", password_confirmation: "shhh")
