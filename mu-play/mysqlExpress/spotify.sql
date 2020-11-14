DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify;
USE spotify;

DROP TABLE IF EXISTS artists;
CREATE TABLE artists(
id INT AUTO_INCREMENT NOT NULL,
artist_name VARCHAR(255),
artist_img_url VARCHAR(255),
PRIMARY KEY (id)
);


DROP TABLE IF EXISTS albums;
CREATE TABLE albums(
id INT AUTO_INCREMENT NOT NULL,
artist_id INT,
album_name VARCHAR(255),
cover_img_url VARCHAR(255),
release_date YEAR,
FOREIGN KEY (artist_id) REFERENCES artists(id),
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS songs;
CREATE TABLE songs(
id INT AUTO_INCREMENT NOT NULL,
song_name VARCHAR(255),
artist_id INT,
album_id INT,
youtube_url VARCHAR(255),
lyrics_url VARCHAR(255),
release_date YEAR,
Plays INT DEFAULT (RAND()*1000000),
FOREIGN KEY (album_id) REFERENCES albums(id),
FOREIGN KEY (artist_id) REFERENCES artists(id),
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS playlists;
CREATE TABLE playlists(
id INT AUTO_INCREMENT NOT NULL,
playlist_name VARCHAR(255), 
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS playlist_songs;
CREATE TABLE playlist_songs(
id INT AUTO_INCREMENT NOT NULL,
playlist_id INT,
song_id INT,
FOREIGN KEY (song_id) REFERENCES songs(id),
PRIMARY KEY (id)
);

INSERT INTO artists(artist_name, artist_img_url) VALUES ('Ozric Tentacles', 'https://img.discogs.com/_dqTuzdvN-eTs4kzBewgFILT1qM=/600x337/smart/filters:strip_icc():format(jpeg):mode_rgb():quality(90)/discogs-images/A-17419-1431625491-1583.jpeg.jpg');
INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		    VALUES(1,'Erpland','https://i.ytimg.com/vi/UVZxpoq166Q/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLClup7-vZEwUr7gTwAfPrywro8SzQ',2005);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Eternal Wheel',1,1,'https://www.youtube.com/watch?v=UVZxpoq166Q&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=1',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('toltec spring',1,1,'https://www.youtube.com/watch?v=ufpAtHIeRns&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=2',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Tidal Convergence',1,1,'https://www.youtube.com/watch?v=-JaWDz10Cr0&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=3',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Sunscape',1,1,'https://www.youtube.com/watch?v=GjZRAAZkRfI&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=4',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Mysticum Arabicola',1,1,'https://www.youtube.com/watch?v=-GinMx2OGIo&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=5',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Crackerblocks',1,1,'https://www.youtube.com/watch?v=ZjtfdisDhuo&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=6',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('The Throbbe',1,1,'https://www.youtube.com/watch?v=rpM-bpwLsrs&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=7',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(' Erpland',1,1,'https://www.youtube.com/watch?v=PQqRVxSpa6Q&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=8',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Valley Of A Thousand Thoughts',1,1,'https://www.youtube.com/watch?v=myOJRrmNfyE&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=9',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Snakepit',1,1,'https://www.youtube.com/watch?v=4c2TzjkA4-g&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=10',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Iscence',1,1,'https://www.youtube.com/watch?v=afdkxlaAb7c&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=11',1990);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('A Gift Of Wings',1,1,'https://www.youtube.com/watch?v=XU5qdgMedsU&list=PL8a8cutYP7foIxnvnguEeaFkz5LToLx1L&index=12',1990);

INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		VALUES(1,'At The Pongmasters Ball','https://i.ytimg.com/vi/qsOlkRVl5mw/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCBRNUX3WBxDd_QnvmVZKKMz9IrPw',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Oddentity',1,2,'https://www.youtube.com/watch?v=qsOlkRVl5mw&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=1',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Erpland',1,2,'https://www.youtube.com/watch?v=NsQ_jD4-hkc&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=2',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Oakum',1,2,'https://www.youtube.com/watch?v=_yxsaXQSoUU&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=3',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Myriapod',1,2,'https://www.youtube.com/watch?v=eO-PktpZ-5Y&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=4',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Its A Hup-Ho World',1,2,'https://www.youtube.com/watch?v=iYxPf-lvLpI&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=5',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Pixel Dream',1,2,'https://www.youtube.com/watch?v=EJp36xuaFrA&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=6',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('The Domes Of G Bal',1,2,'https://www.youtube.com/watch?v=5mUAKaQVR5g&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=7',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Pyramidion',1,2,'https://www.youtube.com/watch?v=hr3Ok7xVREg&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=8',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Saucers',1,2,'https://www.youtube.com/watch?v=cJPJmjBg5i0&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=9',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Dissolution',1,2,'https://www.youtube.com/watch?v=UlBdI55eem0&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=10',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Sploosh ',1,2,'https://www.youtube.com/watch?v=0cb8cOXuIEU&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=11',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Ta Khut',1,2,'https://www.youtube.com/watch?v=YaeND1sTgVc&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=12',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Kick Muck',1,2,'https://www.youtube.com/watch?v=V87aXX0TxfE&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=13',2002);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('The Throbbe',1,2,'https://www.youtube.com/watch?v=C2Tp7VM-sd8&list=OLAK5uy_nxZUSSQJMGFHRyoMBEucLFaM5Ca7f9zVI&index=14',2002);
         
         
INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		    VALUES(1,'The Floor is Too Far Away','https://i.ytimg.com/vi/x_40ZQn43-8/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBYKVd0duoxBnv3yCjW5pmO1GqqVA',2006);
		INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Bolshem',1,3,'https://www.youtube.com/watch?v=x_40ZQn43-8&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=1',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Armchair Journey',1,3,'https://www.youtube.com/watch?v=Ji8dEI7Wtpg&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=2',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Jellylips',1,3,'https://www.youtube.com/watch?v=rauEZa0AZWw&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=3',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Vedavox',1,3,'https://www.youtube.com/watch?v=zXa94A0DQqo&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=4',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Spacebase',1,3,'https://www.youtube.com/watch?v=DggAoD_RrCg&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=5',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Disdots',1,3,'https://www.youtube.com/watch?v=s3Qgq4ldV0o&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=6',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Etherclock',1,3,'https://www.youtube.com/watch?v=NXS6J-ksQrM&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=7',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Splat!',1,3,'https://www.youtube.com/watch?v=nx7lMnZ437g&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=8',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Ping',1,3,'https://www.youtube.com/watch?v=Wle1vfczzVU&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=9',2006);
        INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
        VALUES('Chewier',1,3,'https://www.youtube.com/watch?v=e_lQwkRoPtM&list=OLAK5uy_ldy6bsfE9sRztaFzHDe2tUW5wuSL-twkQ&index=10',2006);



INSERT INTO artists(artist_name, artist_img_url) VALUES ('Ott','https://i.ytimg.com/vi/rgKel7_UKoE/maxresdefault.jpg');
INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		    VALUES(2,'Blumenkraft','https://i.ytimg.com/vi/LjcUFm3ohRo/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBV3HNKnF47tixph7Bta_8USq6eVQ',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Jack's Cheese And Bread Snack",2,4,'https://www.youtube.com/watch?v=LjcUFm3ohRo&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=1',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Somersettler",2,4,'https://www.youtube.com/watch?v=6yXCkM6Mu6w&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=2',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Splitting An Atom",2,4,'https://www.youtube.com/watch?v=YX5SJtZ5xPE&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=3',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Escape From Tulse Hell",2,4,'https://www.youtube.com/watch?v=VaS2q-wBgyI&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=4',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Cley Hill",2,4,'https://www.youtube.com/watch?v=96z6l2VLHB8&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=5',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Billy the Kid Strikes Back",2,4,'https://www.youtube.com/watch?v=SIqp2rH_zq0&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=6',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("A Load up at Nunney Catch",2,4,'https://www.youtube.com/watch?v=PzCWiOpBCFc&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=7',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Spannered In Pilton",2,4,'https://www.youtube.com/watch?v=3FBP99CtJW4&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=8',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Smoked Glass And Chrome",2,4,'https://www.youtube.com/watch?v=rPqsnHAsFi8&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=9',2003);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Scilly Automatic",2,4,'https://www.youtube.com/watch?v=asmmDLBvgD4&list=OLAK5uy_nlTFN31wq6YiJ0CScPTG0dzSEsmIPdRGQ&index=10',2003);

INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		    VALUES(2,'Skylon','https://i.ytimg.com/vi/HqEi54H0pWo/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLCKwvs0pqqoAFzDnCQRVZmEG0YREQ',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("From Trunch To Stromness",2,5,'https://www.youtube.com/watch?v=YwRT8FdeChE&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=1',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("The Queen of All Everything",2,5,'https://www.youtube.com/watch?v=116gLvsQA4A&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=2',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(" Rogue Bagel",2,5,'https://www.youtube.com/watch?v=HqEi54H0pWo&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=3',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(" Daisies And Rubies",2,5,'https://www.youtube.com/watch?v=XZykYGsR6Ik&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=4',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("Signals From Bob",2,5,'https://www.youtube.com/watch?v=xUtlrbOkxN0&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=5',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("382 Seaside",2,5,'https://www.youtube.com/watch?v=tcEckkK4xkQ&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=6',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(" Roflcopter",2,5,'https://www.youtube.com/watch?v=OL766y0C95o&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=7',2008);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(" A Shower of Sparks",2,5,'https://www.youtube.com/watch?v=OLO_3yKeEcg&list=OLAK5uy_mgSien2vJFBN_nn2SG5KPr2n0rHuIRj_M&index=8',2008);


INSERT INTO artists(artist_name, artist_img_url) VALUES ('Tipper','http://204ksp3os7r62w5qhokpkxci.wpengine.netdna-cdn.com/wp-content/uploads/Tipper11.jpg');
INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
		    VALUES(3,' forward escape','https://i.ytimg.com/vi/ARAtXqFdPcA/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLDvE2rJhHAKyTpn9G4rtO4dwKAA2g',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Portal Spillage',3,6,'https://www.youtube.com/watch?v=ARAtXqFdPcA&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=1',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Dreamsters Tipper',3,6,'https://www.youtube.com/watch?v=w6kTGhJIMgw&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=2',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Homage Sliders',3,6,'https://www.youtube.com/watch?v=RqcjFx-Vw78&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=3',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Table Flipping',3,6,'https://www.youtube.com/watch?v=kYjANtc-9Xg&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=4',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Gulch',3,6,'https://www.youtube.com/watch?v=tH38CyDfx4U&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=5',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Grabbers Holders',3,6,'https://www.youtube.com/watch?v=3wA-efbwxMg&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=6',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(' The Bedraggling',3,6,'https://www.youtube.com/watch?v=LhGKZqUzyoE&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=7',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('FORWARD ESCAPE',3,6,'https://www.youtube.com/watch?v=8cDudlTKxbY&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=8',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(' The Re-Up',3,6,'https://www.youtube.com/watch?v=hIB4FzGxZ9c&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=9',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Apex of The Vortex',3,6,'https://www.youtube.com/watch?v=RTtK2CCEYDI&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=10',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Rip Cord',3,6,'https://www.youtube.com/watch?v=V7DXuekscg0&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=11',2014);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Reverse Dross Maneuver',3,6,'https://www.youtube.com/watch?v=g0d22cea72E&list=PLQ4X3Eg6ytWZJroibmA5GJb_gPvrjK3GE&index=12',2014);

INSERT INTO albums(artist_id,album_name ,cover_img_url, release_date)
VALUES(3,' jettison mind hatch','https://i.ytimg.com/vi/YThxh8BQKZE/hqdefault.jpg?sqp=-oaymwEYCKgBEF5IVfKriqkDCwgBFQAAiEIYAXAB&rs=AOn4CLBL3GFyJuMQhsfCqKzeGM_A4aUtGQ',2019);
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Sayonara',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Vection ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Baleen ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES(' Exit Chapel Perilous',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Viscous ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Sahra ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES("C'est La Vie",3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Oi Oi Spit',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Tether',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Permatemp ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Fallow ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );
INSERT INTO songs(song_name,artist_id,album_id,youtube_url,release_date)
VALUES('Shelled ',3,7,'https://www.youtube.com/watch?v=YThxh8BQKZE&list=PL19LTR-Jdd4b1DseVSk05RR7yKoftogri',2019 );

-- playlists
INSERT INTO playlists(playlist_name) VALUES('spacy');
INSERT INTO playlists(playlist_name) VALUES('galactic chill');
INSERT INTO playlists(playlist_name) VALUES('uneversal peace');

INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,57);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,26);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,74);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,56);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,73);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,24);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,9);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(1,32);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,11);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,22);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,33);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,44);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,55);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,66);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(2,77);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,21);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,32);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,43);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,54);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,65);
INSERT INTO playlist_songs(playlist_id,song_id) VALUES(3,76);






