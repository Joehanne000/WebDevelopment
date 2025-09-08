CREATE TABLE if not exists users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    picture VARCHAR(255),
    bio TEXT,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE posts (
    post_id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE likes (
    like_id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE comments (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    post_id INT NOT NULL,
    user_id INT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(post_id),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE followers (
    follow_id INT AUTO_INCREMENT PRIMARY KEY,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    follower_id INT NOT NULL,
    followed_id INT NOT NULL,
    FOREIGN KEY (follower_id) REFERENCES users(user_id),
    FOREIGN KEY (followed_id) REFERENCES users(user_id),
    UNIQUE(follower_id, followed_id) -- a user can only follow another user once
);

Insert into users (username, password, email) 
values ("limmonjuice", "1234", "limmonj@gmail.com"),
       ("izidl", "0987", "izidl@gmail.com");

Insert into profiles (picture, bio, user_id)
values ("pic1.jpg", "I'm limmonjuice!", 1),
       ("pic2.jpg", "I'm izidl!", 2);

Insert into posts (content, user_id)
values ("3/21 paldo", 1),
       ("drained na drained na", 2),
       ("fresh grad here from nstp", 2);

Insert into likes (post_id, user_id)
values (3,1),
       (1,2);

Insert into comments (post_id, user_id, content)
values (2,1,"tulog mo na yan boss"),
       (3,1,"congrats!");

Insert into followers (followed_id, follower_id)   
values (2,1),
       (1,2);    



