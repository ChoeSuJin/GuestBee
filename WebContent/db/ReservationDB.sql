
create table GuestHouse {
	gh_ID varchar2(20) not null,
	gh_Name varchar2(20) not null,
	gh_Local varchar2(5) not null,
	gh_Img1 varchar2(100) not null,
	gh_Img2 varchar2(100),
	gh_Img3 varchar2(100),
	gh_Img4 varchar2(100),
	gh_Img5 varchar2(100),
	gh_Wifi char(1) check(principal IN('T', 'F')) not null,
	gh_ShareToilet char(1) check(principal IN('T', 'F')) not null,
	gh_PrivateRoim char(1) check(principal IN('T', 'F')) not null,
	gh_LateCheck char(1) check(principal IN('T', 'F')) not null,
}