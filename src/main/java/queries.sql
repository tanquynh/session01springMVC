drop database if exists spring_mvc_db;
create database spring_mvc_db;
use spring_mvc_db;

create table category
(
    id int primary key auto_increment,
    name varchar(50) not null unique,
    status bit(1) default 1
)
;

create table product
(
    id          int primary key auto_increment,
    name        varchar(100) not null ,
    price       double        not null,
    image varchar(255),
    category_id int          not null,
    constraint fk_ci_product foreign key (category_id) references category (id),
    status bit(1) not null default 1
);

create table product_category
(
    product_id int not null,
    constraint fk_pi_pc foreign key (product_id) references product(id),
    category_id int not null,
    constraint fk_ci_pc foreign key (category_id) references category(id)
);


insert into category (name) values ('Thực phẩm'), ('Trang phục'), ('Đồ gia dụng'), ('Thiết bị điện tử');

insert into product (name, price, image, category_id, status) values
('Thịt ba chỉ', 100000, 'thit-ba-chi.webp', 1, 1),
('Rau muống VietGAP', 10000, 'rau-muong-vietgap.png', 1, 0),
('Quần kaki', 230000, 'quan-kaki.webp', 2, 1),
('Áo Hoodie', 450000, 'ao-hoodie.webp', 2, 0),
('Đế hâm nóng đồ uống', 150000, 'de-ham-nong-do-uong.jpg', 3, 0),
('Tăm nước', 95000, 'tam-nuoc.webp', 4, 1) ;

#PRODUCT
# get all product
delimiter //
create procedure getAllProducts()
begin
    select * from product;
end //
delimiter ;

# add product
delimiter //
create procedure addProduct(pName varchar(255), pPrice float, pImage text, pCategoryId int, pStatus bit(1))
begin
    insert into product (name, price, image, category_id, status) VALUES (pName, pPrice, pImage, pCategoryId, pStatus);
end //
delimiter ;

# get product by id
delimiter //
create procedure getProductById(pId int)
begin
    select * from product where id = pId;
end //
delimiter ;

# update product
delimiter //
create procedure updateProductById(pName varchar(100), pPrice float, pImage text, pCategoryId int, pStatus bit(1), pId int)
begin
    update product set name = pName, price = pPrice, image = pImage, category_id = pCategoryId, status = pStatus where id = pId;
end //
delimiter ;

# update product
delimiter //
create procedure deleteProductById(pId int)
begin
    delete from product where id = pId;
end //
delimiter ;

#CATEGORY
# get all category
delimiter //
create procedure getAllCategories()
begin
    select * from category;
end //
delimiter ;

# add category
delimiter //
create procedure addCategory(pName varchar(50), pStatus bit(1))
begin
    insert into category (name, status) VALUES (pName, pStatus);
end //
delimiter ;

# get category by id
delimiter //
create procedure getCategoryById(pId int)
begin
    select * from category where id = pId;
end //
delimiter ;

# update category
delimiter //
create procedure updateCategoryById(pName varchar(50), pStatus bit(1), pId int)
begin
    update category set name = pName, status = pStatus where id = pId;
end //
delimiter ;

# update category
# [?] khi xóa category thì điều gì xảy ra với sản phẩm?
delimiter //
create procedure deleteCategoryById(pId int)
begin
    delete from category where id = pId;
end //
delimiter ;