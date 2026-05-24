delete from users;
delete from roles;
delete from menus;
delete from rolesmapping;

insert into users(fullname,phone,email,password,role,status) values
('ADMIN', '9876543210', 'admin@mth.com', '123', 3, 1),
('MANAGER', '1234567890', 'manager@mth.com', '123', 2, 1),
('USER', '9876123450', 'user@mth.com', '123', 3, 1);

insert into roles(role,rolename) values
(1, 'User'),
(2, 'Manager'),
(3, 'Admin');

insert into menus(mid,menu,micon) values
(1, 'Dashboard', 'dashboard.png'),
(2, 'My Task', 'mytask.png'),
(3, 'Task Manager', 'taskmanager.png'),
(4, 'User Manager', 'usermanager.png'),
(5, 'Profile', 'profile.png');

insert into rolesmapping(mid,role) values
(1, 3),
(2, 3),
(3, 3),
(4, 3),
(5, 3),
(1, 2),
(3, 2),
(5, 2),
(1, 1),
(2, 1),
(5, 1);

select * from users;

select * from roles;

select * from menus;

select * from rolesmapping;