create user c##market identified by c##market;
grant connect to c##market;
grant resource to c##market;
alter user c##market quota 1024m on users;