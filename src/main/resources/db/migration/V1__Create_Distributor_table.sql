create table Distributor (
    DistributorID int(10) unsigned NOT NULL AUTO_INCREMENT, /* identity column.  LegalEntityID? */
    DistributorNum varchar(10) not null, /* the usual distributor number */
    Active enum('Y','N') not null default 'Y', /* is this user currently active? */
    OfficeNum varchar(3) not null, /* the user's current network office */

    primary key (DistributorID),
    unique key (DistributorNum),
    key (OfficeNum, Active) /* to facilitate searches of active FRs in an office */
)

    
