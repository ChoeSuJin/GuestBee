
--ID-guestbee
--pwd-oracle
drop table LocalCodeDB;
create table LocalCodeDB(
	lc_name varchar2(10) not null,
	lc_num varchar2(5) not null,
	constraint localCode_num_pk primary key(lc_num)
)

create table GuestHouseDB(
	gh_ID varchar2(20) not null,
	gh_Name varchar2(20) not null,
	gh_Local varchar2(5) not null,
	gh_Img1 varchar2(100) not null,
	gh_Img2 varchar2(100),
	gh_Img3 varchar2(100),
	gh_Img4 varchar2(100),
	gh_Img5 varchar2(100),
	gh_Wifi char(1) check(gh_Wifi IN('0' || '1')),
	gh_ShareToilet char(1) check(gh_ShareToilet IN(0 || 1)),
	gh_PrivateRoom char(1) check(gh_PrivateRoom IN(0 || 1)),
	gh_LateCheck char(1) check(gh_LateCheck IN(0 || 1)),
	gh_Longitude varchar2(10) not null,
	gh_Latitude varchar2(10) not null,
	constraint guestHouse_ID_pk primary key(gh_ID)
)

create table reservationInformationDB (
	ri_ID varchar2(20) not null,
	ri_Date date not null,
	ri_Price number(10) not null,
	ri_People number(10) not null,
	ri_UserID varchar2(20) not null
)