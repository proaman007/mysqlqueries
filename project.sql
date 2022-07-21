CREATE DATABASE project;
use project;

CREATE TABLE user(
     user_id INT,
     media_id INT,
     user_name VARCHAR(45),
     PRIMARY KEY(user_id)
     );


 CREATE TABLE project
     (
     project_id INT,
     project_name VARCHAR(25),
     PRIMARY KEY(project_id)
     );


CREATE TABLE project_has_user(
     project_id INT,
     user_id INT,
     manager TINYINT(1),
    CONSTRAINT FK_project_has_user FOREIGN KEY(project_id) REFERENCES project(project_id),
     CONSTRAINT FK_project_has_user1 FOREIGN KEY(user_id) REFERENCES user(USER_id)
);

CREATE TABLE media (
  media_id INT,
  media_user_id INT,
  path VARCHAR(70),
  filetype VARCHAR(20),
  filesize DECIMAL(65,2),
  PRIMARY KEY(media_id),
  FOREIGN KEY (media_user_id) REFERENCES user(USER_id)
);

CREATE TABLE bug(
  bug_id INT,
  bug_project_id INT,
  bug_name VARCHAR(45),
  PRIMARY kEY(bug_id),
 FOREIGN KEY(bug_project_id) REFERENCES project(project_id)

);

CREATE TABLE bug_has_media(
  bug_id INT,
  bug_project_id INT,
   media_id INT,
    FOREIGN KEY (bug_id) REFERENCES bug(bug_id),
    FOREIGN KEY (bug_project_id) REFERENCES bug(bug_project_id),
    FOREIGN KEY (media_id) REFERENCES media(media_id)
);

CREATE TABLE comment(
  comment_id INT,
bug_project_id INT,
 bug_id INT,
 comment_text TEXT,
 PRIMARY kEY(comment_id),
   FOREIGN KEY (bug_id) REFERENCES bug(bug_id),
   FOREIGN KEY (bug_project_id) REFERENCES bug(bug_project_id)
);

CREATE TABLE comment_has_media(
   comment_id INT,
   comment_bug_project_id INT,
   comment_bug_id INT,
   media_id INT,
    FOREIGN KEY (comment_id) REFERENCES comment(comment_id),
   FOREIGN KEY (comment_bug_project_id) REFERENCES comment(bug_project_id),
   FOREIGN KEY (media_id) REFERENCES media(media_id),
    FOREIGN KEY (comment_bug_id) REFERENCES comment(bug_id)
);





INSERT INTO user(user_id,user_name) VALUES(1,"sober");
 INSERT INTO project(project_id,project_name) VALUES(1,"poppy"),
(2,"shrooms");
INSERT INTO project_has_user(project_id,user_id,manager) VALUES(1,1,1);
INSERT INTO media(media_id,media_user_id,path,filetype,filesize) VALUES(1,1,"amsterdam","brocode",420.69);
INSERT INTO bug(bug_id,bug_project_id,bug_name) VALUES(1,1,"button not working");
INSERT INTO bug_has_media(bug_id,bug_project_id,media_id) VALUES(1,1,1);
INSERT INTO comment(comment_id,bug_project_id,bug_id,comment_text) VALUES(1,1,1,"text");
INSERT INTO comment_has_media(comment_id,comment_bug_project_id,comment_bug_id,media_id) VALUES(1,1,1,1);

SELECT * FROM user;

