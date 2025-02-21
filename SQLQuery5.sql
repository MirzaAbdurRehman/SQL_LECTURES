


use University;

if Not Exists (select * from INFORMATION_SCHEMA.TABLES where TABLE_NAME='Users')
Begin 
   create table Users (
   id int identity(1,1) primary key,
   name varchar(50) not null,
   email varchar(50) unique not null
   );
   print 'User Table created Successfully';

END

Begin try
   begin Transaction;

   insert into Users (name,email) values ('salman','salman@gmail.com');

   commit Transaction;
   print 'Data inserted Successfully';

end try

begin catch

  rollback Transaction;

  print 'Error Occured';

select 
    ERROR_NUMBER() as ErrorNumber,
	ERROR_MESSAGE() as ErrorMessage,
	ERROR_SEVERITY() as ErrorSeverity,
	ERROR_STATE() as ErrorState;
end catch

