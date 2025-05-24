set serveroutput on;
--SETUP CODE------------------------------------
--Drop Table Statements
Drop Table Cuisine_Type Cascade Constraints;
Drop Table Recommendations Cascade Constraints;
Drop Table Restaurants Cascade Constraints;
Drop Table Reviews Cascade Constraints;
Drop Table Waiters Cascade Constraints;
Drop Table Orders Cascade Constraints;
Drop Table Menu_Items Cascade Constraints;
Drop Table Customers Cascade Constraints;
Drop Table Restaurant_Inventory Cascade Constraints;
Drop Table Recommendations_Test Cascade Constraints;

--Drop Sequence Statements
Drop Sequence seq_CuisineTypeID;
Drop Sequence seq_RecommendationID;
Drop Sequence seq_RestaurantID;
Drop Sequence seq_ReviewID;
Drop Sequence seq_WaiterID;
Drop Sequence seq_OrderID;
Drop Sequence seq_CustomerID;
Drop Sequence seq_MenuItemsID;
Drop Sequence seq_RestaurantInventoryID;

--Drop Function Statements
Drop Function FIND_CUISINE_TYPE_ID;
Drop Function FIND_CUISINE_TYPE_ID_2;
Drop Function FIND_CUSTOMER_ID;
Drop Function FIND_MENU_ITEM_ID;
Drop Function FIND_ORDER_ID;
Drop Function FIND_RESTAURANT_ID;
Drop Function FIND_RESTAURANT_ID_2;
Drop Function FIND_WAITER_ID;

--Drop Procedure Statements
Drop Procedure ADD_CUISINE_TYPE;
Drop Procedure ADD_CUSTOMER;
Drop Procedure ADD_RESTAURANT;
Drop Procedure ADD_REVIEW;
Drop Procedure ADDMENUITEM;
Drop Procedure BUY_OR_BEWARE;
Drop Procedure CREATEMENUITEM;
Drop Procedure DISPLAY_RESTAURANTS_BY_CUISINE;
Drop Procedure HIRE_WAITER;
Drop Procedure LIST_ORDERS;
Drop Procedure LIST_RECOMMENDATIONS;
Drop Procedure LIST_RECOMMENDATIONS_TEST;
Drop Procedure PLACE_ORDER;
Drop Procedure RECOMMEND_TO_CUSTOMER;
Drop Procedure REPORT_INCOME_BY_STATE;
Drop Procedure REPORT_TIPS;
Drop Procedure REPORTMENUITEMS;
Drop Procedure REPORTTIPS_BYSTATE;
Drop Procedure TOP_THREE_REPORT;
Drop Procedure UPDATEINVENTORY;
Drop Procedure WAITER_LIST1;


--Table Creation Statements
CREATE TABLE Cuisine_Type ( 
    CuisineTypeID NUMBER PRIMARY KEY, 
    CuisineTypeName VARCHAR2(30)
);

CREATE TABLE Restaurants (
    RestaurantID NUMBER PRIMARY KEY, 
    CuisineTypeID NUMBER references Cuisine_Type(CuisineTypeID),
    RestaurantName VARCHAR2(120),
    RestaurantStreetAddress VARCHAR2(175),
    RestaurantCity VARCHAR2(75),
    RestaurantState VARCHAR2(60),
    RestaurantZip VARCHAR2(30)
);

CREATE TABLE Waiters (
    WaiterID NUMBER PRIMARY KEY,
    RestaurantID NUMBER references Restaurants(RestaurantID),
    WaiterName VARCHAR2(120)
);

CREATE TABLE Menu_Items (
    MenuItemsID NUMBER PRIMARY KEY,
    CuisineTypeID NUMBER references Cuisine_Type(CuisineTypeID),
    MenuItemName VARCHAR2(150),
    MenuItemPrice NUMBER(8,3)
);

CREATE TABLE Restaurant_Inventory (
    RestaurantInventoryID NUMBER PRIMARY KEY,
    RestaurantID NUMBER references Restaurants(RestaurantID),
    MenuItemsID NUMBER references Menu_Items(MenuItemsID),
    RestaurantInventoryQuantity NUMBER
);

CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY, 
    CustomerName VARCHAR2(120),
    CustomerEmail VARCHAR2(120),
    CustomerStreetAddress VARCHAR2(130),
    CustomerCity VARCHAR2(60),
    CustomerState VARCHAR2(60),
    CustomerZip VARCHAR2(30),
    CustomerCreditCardNumber VARCHAR2(30)
);

CREATE TABLE Orders (
    OrderID NUMBER PRIMARY KEY,
    RestaurantID NUMBER references Restaurants(RestaurantID),
    WaiterID NUMBER references Waiters(WaiterID),
    MenuItemID NUMBER references Menu_Items(MenuItemsID),
    CustomerID NUMBER references Customers(CustomerID),
    OrderAmountPaid NUMBER(8,3), 
    OrderTip NUMBER(8,3),
    OrderDate DATE DEFAULT sysdate
);

CREATE TABLE Reviews (
    ReviewID NUMBER PRIMARY KEY,
    RestaurantID NUMBER references Restaurants(RestaurantID),
    ReviewerEmail VARCHAR2(130),
    StarGiven NUMBER(5),
    ReviewText VARCHAR2(250)
);

CREATE TABLE Recommendations (
    RecommendationID NUMBER PRIMARY KEY,
    CustomerID NUMBER references Customers(CustomerID),
    RestaurantID NUMBER references Restaurants(RestaurantID),
    RecommendationDate DATE
);


--Sequence Creation Statements
Create Sequence seq_CuisineTypeID
START WITH 1 INCREMENT BY 1;
 
Create Sequence seq_RecommendationID
START WITH 1 INCREMENT BY 1;
 
Create Sequence seq_RestaurantID 
START WITH 1 INCREMENT BY 1;

Create Sequence seq_ReviewID 
START WITH 1 INCREMENT BY 1;

Create Sequence seq_WaiterID 
START WITH 1 INCREMENT BY 1;

Create Sequence seq_OrderID
START WITH 1 INCREMENT BY 1;

Create Sequence seq_CustomerID 
START WITH 1 INCREMENT BY 1;

Create Sequence seq_MenuItemsID
START WITH 1 INCREMENT BY 1;
 
Create Sequence seq_RestaurantInventoryID 
START WITH 1 INCREMENT BY 1;



--Cusine Type Insert Statements
INSERT into Cuisine_Type values (seq_CuisineTypeID.NEXTVAL, 'American');
INSERT into Cuisine_Type values (seq_CuisineTypeID.NEXTVAL, 'BBQ');
INSERT into Cuisine_Type values (seq_CuisineTypeID.NEXTVAL, 'Indian');
INSERT into Cuisine_Type values (seq_CuisineTypeID.NEXTVAL, 'Italian');
INSERT into Cuisine_Type values (seq_CuisineTypeID.NEXTVAL, 'Ethiopian');


--Restaurants Insert Statements
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 1, 'Liberty Grille', '10454 Faulkner Ridge', 'Glen Burnie', 'MD', '21061'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 1, 'Freedom Feasts', '21915 Stout Street', 'Severna Park', 'MD', '21108');
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 2, 'Fire and Flavor', '67637 Davidson Ave', 'Annapolis', 'MD', '21401');
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 2, 'Grill Masters BBQ', '74698 Franklin Road', 'Columbia', 'MD', '21045'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 3, 'The Spice Route', '93945 Western Road', 'Frederick', 'MD', '21703');
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 3, 'Tandoori Tales', '97602 Lotus Court', 'Bowie', 'MD', '20715'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 4, 'Ciao Amore', '81955 Rosemary Street', 'Harwood', 'MD', '20776'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 4, 'Pizzeria di Roma', '63894 Palace Street', 'Severn', 'MD', '21144'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 5, 'Injera Delight', '48952 Lion Road', 'Hanover', 'MD', '21076'); 
INSERT into Restaurants values (seq_RestaurantID.NEXTVAL, 5, 'Nile Flavors', '61436 Kirkland Drive', 'Rosedale', 'MD', '21221');  


--Waiter Insert Statements
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 1, '1'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 2, ' Baker'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 3, ' Hollingsworth');
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 4, 'Aji Fatou Gai'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 5, 'Andrew Hollander');
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 6, 'Alfonzo Rush'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 7, 'Alberta Prince'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 8, 'Wilson Anthony');
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 9, 'Dana Barrett'); 
INSERT into Waiters values (seq_WaiterID.NEXTVAL, 10, 'Lindsay Meza');


--Menu Item Insert Statements

--American Cuisine Menu Items
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 1, 'Burger', 18.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 1, 'Fries', 7.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 1, 'Pasta', 21.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 1, 'Salad', 16.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 1, 'Salmon', 19.99);


--BBQ Cuisine Menu Items
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 2, 'Steak', 20.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 2, 'Pork Loin', 19.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 2, 'Fillet Mignon', 23.99);


--Indian Cuisine Menu Items
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 3, 'Dal Soup', 18.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 3, 'Rice', 10.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 3, 'Tandoori Chicken', 21.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 3, 'Samosa', 19.99);


--Italian Cuisine Menu Items
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 4, 'Lasagna', 16.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 4, 'Meatballs', 20.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 4, 'Spaghetti', 18.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 4, 'Pizza', 17.99);


--Ethiopian Cuisine Menu Items
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 5, 'Meat Chunks', 19.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 5, 'Legume Stew', 22.99);
INSERT into Menu_Items values (seq_MenuItemsID.NEXTVAL, 5, 'Flatbread', 9.99);


--Restaurant Inventory Insert Statements

--Liberty Grille Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 1, 1, 54);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 1, 2, 88);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 1, 3, 67);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 1, 4, 97);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 1, 5, 45);


--Freedom Feasts Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 2, 1, 45);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 2, 2, 51);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 2, 3, 52);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 2, 4, 84);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 2, 5, 95);


--Fire & Flavor Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 3, 6, 82);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 3, 7, 68);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 3, 8, 46);


--Grill Masters BBQ Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 4, 6, 76);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 4, 7, 59);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 4, 8, 38);


--The Spice Route Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 5, 9, 95);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 5, 10, 36);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 5, 11, 96);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 5, 12, 70);


--Tandoori Tales Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 6, 9, 94);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 6, 10, 82);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 6, 11, 67);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 6, 12, 59);


--Ciao Amore Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 7, 13, 29);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 7, 14, 67);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 7, 15, 26);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 7, 16, 31);


--Pizzeria di Roma Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 8, 13, 72);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 8, 14, 54);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 8, 15, 77);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 8, 16, 42);


--Injera Delight Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 9, 17, 37);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 9, 18, 52);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 9, 19, 33);


--Nile Flavors Inventory
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 10, 17, 44);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 10, 18, 89);
INSERT into Restaurant_Inventory values (seq_RestaurantInventoryID.NEXTVAL, 10, 19, 62);


--Customer Insert Statements
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Priscilla Asamoah', 'pasamoah@gmail.com', '2233 Old Rico Ave', 'Columbia', 'MD', '21045', '4744883929123'); 
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Raven Amankwaah', 'ravensam@yahoo.com', '8292 New Man St', 'Glen Burnie', 'MD', '21061', '3528648071023504');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Ricky Dangota', 'dangotarick@gmail.com', '2849 Love Ave', 'Bowie', 'MD', '20715', '4944893929122');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Neveah Lamb', 'neveahlamb@gmail.com', '9745 Livingston Rd', 'Severn', 'MD', '21144', '5298233123870567');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Gianni Friedman', 'giannifriedman@gmail.com', '9267 Old Tallwood Dr', 'Laurel', 'MD', '20707', '4075512037374770');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Raina Cooke', 'rainacooke@gmail.com', '9805 South Sussex Ave', 'Arbutus', 'MD', '21227', '6011622620823142');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Dante Chapman', 'dantechapman@gmail.com', '8269 N. Summit Ave', 'Baltimore', 'MD', '21208', '5475359452967123');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Taliyah Riggs', 'taliyahriggs@gmail.com', '9685 Highland Rd', 'Sliver Spring', 'MD', '20901', '6539505173130654');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Brandon Hinton', 'brandonhinton@gmail.com', '8770 Hillside Circle', 'Arnold', 'MD', '21409', '4282104191181099');
INSERT into Customers values (seq_CustomerID.NEXTVAL, 'Nyasia Gibbs', 'naysiagibbs@gmail.com', '8080 Silver Spear Ave', 'Odenton', 'MD', '21113', '5125601235189952');


--Orders Insert Statements
INSERT into Orders values (seq_OrderID.NEXTVAL, 1, 1, 1, 1, 
(select menuitemprice from menu_items where MenuItemsID = 1), (select menuitemprice from menu_items where MenuItemsID = 1)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 2, 2, 3, 2, 
(select menuitemprice from menu_items where MenuItemsID = 3), (select menuitemprice from menu_items where MenuItemsID = 3)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 3, 3, 6, 3, 
(select menuitemprice from menu_items where MenuItemsID = 6), (select menuitemprice from menu_items where MenuItemsID = 6)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 4, 4, 7, 4, 
(select menuitemprice from menu_items where MenuItemsID = 7), (select menuitemprice from menu_items where MenuItemsID = 7)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 5, 5, 10, 5,
(select menuitemprice from menu_items where MenuItemsID = 10), (select menuitemprice from menu_items where MenuItemsID = 10)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 6, 6, 12, 6,
(select menuitemprice from menu_items where MenuItemsID = 12), (select menuitemprice from menu_items where MenuItemsID = 12)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 7, 7, 14, 7, 
(select menuitemprice from menu_items where MenuItemsID = 14), (select menuitemprice from menu_items where MenuItemsID = 14)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 8, 8, 15, 8, 
(select menuitemprice from menu_items where MenuItemsID = 15), (select menuitemprice from menu_items where MenuItemsID = 15)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 9, 9, 18, 9, 
(select menuitemprice from menu_items where MenuItemsID = 18), (select menuitemprice from menu_items where MenuItemsID = 18)  * .20, sysdate);
INSERT into Orders values (seq_OrderID.NEXTVAL, 10, 10, 19, 10,
(select menuitemprice from menu_items where MenuItemsID = 19), (select menuitemprice from menu_items where MenuItemsID = 19)  * .20, sysdate);


--Review Insert Statements
INSERT into Reviews values (seq_ReviewID.NEXTVAL, 1, 'pasamoah@gmail.com', 2, 'The food was okay. But the waiter delayed in bringing my food.');
INSERT into Reviews values (seq_ReviewID.NEXTVAL, 3, 'dangotarick@gmail.com', 5, 'The food was so good. The price make sense for how good it is.'); 
INSERT into Reviews values (seq_ReviewID.NEXTVAL, 5, 'giannifriedman@gmail.com', 1, 'I hated the food. The price was terrible. Waiter was bad.');
INSERT into Reviews values (seq_ReviewID.NEXTVAL, 7, 'dantechapman@gmail.com', 3, 'The food was good. Waiter was friendly but food took a while.');
INSERT into Reviews values (seq_ReviewID.NEXTVAL, 9, 'brandonhinton@gmail.com', 4, 'The food was great. Service was good but the menu is pricy.');


--Recommendation Insert Statements 
--Assuming Reconmmendations are only sent for 3+ star restuarants to customers
--who ate at a restuarant with the saemm cuisine type.
INSERT into Recommendations values (seq_RecommendationID.NEXTVAL, 4, 3, SYSDATE); 
INSERT into Recommendations values (seq_RecommendationID.NEXTVAL, 8, 7, SYSDATE);
INSERT into Recommendations values (seq_RecommendationID.NEXTVAL, 10, 9, SYSDATE);




--HELPER FUNCTION CREATIONS------------------------------------------

create or replace FUNCTION FIND_CUISINE_TYPE_ID(cuisineName IN VARCHAR2)
RETURN NUMBER IS 
    cuisineID NUMBER; -- The purpose of the helper function, FIND_CUISINE_TYPE_ID, is to find the name of a cuisine
BEGIN
    BEGIN
        SELECT CuisineTypeID -- Based on the cuisineName, find the CuisineTypeID 
        INTO cuisineID
        FROM Cuisine_Type
        WHERE CuisineTypeName = cuisineName;

        RETURN cuisineID; -- If we find the ID, then it returns it successfully
    EXCEPTION 
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: This cuisine type is not found.');
            RETURN NULL; -- Nothing will be returned because the ID wasn't found
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: Input is wrong or invalid.');
            RETURN NULL; -- Nothing will be returned because there was an error
    END;
END FIND_CUISINE_TYPE_ID;
/

create or replace function FIND_CUISINE_TYPE_ID_2 (Cuisine_Name in
varchar) return number
is Cuisine_ID number;
begin
    select CuisineTypeID into Cuisine_ID from Cuisine_Type where CuisineTypeName LIKE Cuisine_Name;
    return Cuisine_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such cuisine type');
    return -1;
end;
/


create or replace FUNCTION FIND_RESTAURANT_ID(restaurantName IN VARCHAR2)
RETURN NUMBER IS 
    retrievedID NUMBER; -- The purpose of the helper function, FIND_RESTAURANT_ID, is to find the name of a restaurant
BEGIN
    BEGIN
        SELECT RestaurantID
        INTO retrievedID
        FROM Restaurants
        WHERE RestaurantName = restaurantName;

        RETURN retrievedID; -- If we find the ID, then it returns it successfully
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: The restaurant is not found.');
            RETURN NULL; -- Nothing will be returned because the ID wasn't found
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: Input is wrong or invalid.');
            RETURN NULL; -- Nothing will be returned because there was an error
    END;
END FIND_RESTAURANT_ID;
/

create or replace function FIND_RESTAURANT_ID_2 (Restaurant_Name in
varchar) return number
is Restaurant_ID number;
begin
    select RestaurantID into Restaurant_ID from Restaurants where RestaurantName LIKE Restaurant_Name;
    return Restaurant_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such restaurant');
    return -1;
    when others then
    dbms_output.put_line('Error: Input is wrong or invalid.');
    return -1; -- Nothing will be returned because there was an error
end;
/


create or replace function FIND_MENU_ITEM_ID (Menu_Item_Name in
varchar) return number
is Menu_Item_ID number;
begin
    select MenuItemsID into Menu_Item_ID from Menu_Items where MenuItemName LIKE Menu_Item_Name;
    return Menu_Item_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such menu item');
    return -1;
end;
/



create or replace function FIND_CUSTOMER_ID (Customer_Name in
varchar) return number
is Customer_ID number;
begin
    select CustomerID into Customer_ID from Customers where CustomerName LIKE Customer_Name;
    return Customer_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such customer');
    return -1;
end;
/



create or replace function FIND_WAITER_ID (Waiter_Name in
varchar) return number
is Waiter_ID number;
begin
    select WaiterID into Waiter_ID from Waiters where WaiterName LIKE Waiter_Name;
    return Waiter_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such waiter');
    return -1;
end;
/



create or replace function FIND_ORDER_ID (Restuarant_Name in
varchar, Waiter_Name in varchar, Menu_Item_Name in varchar, Customer_Name in varchar) return number
is Order_ID number;
begin
    select OrderID into Order_ID from Orders 
    where RestaurantID = (Select FIND_RESTAURANT_ID_2(Restuarant_Name) from dual)
    and WaiterID = (Select FIND_WAITER_ID(Waiter_Name) from dual)
    and MenuItemID = (Select FIND_MENU_ITEM_ID(Menu_Item_Name) from dual)
    and CustomerID = (Select FIND_CUSTOMER_ID(Customer_Name) from dual);
    return Order_ID;
exception
    when no_data_found then
    dbms_output.put_line('no such order');
    return -1;
end;
/

commit;




--Member 1 (1): Procedure Create Statements--------------------------------

-- Procedure: ADD_CUISINE_TYPE
CREATE OR REPLACE PROCEDURE ADD_CUISINE_TYPE(cuisineName IN VARCHAR2) IS 
    c_count INTEGER; -- Check if the cuisineName already exists in the Cuisine_Type table
BEGIN
    SELECT COUNT(*)
    INTO c_count
    FROM Cuisine_Type
    WHERE CuisineTypeName = cuisineName;

    IF c_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: The cuisine type ' || cuisineName || ' already exists in the database.');
    ELSE
        BEGIN
            INSERT INTO Cuisine_Type(CuisineTypeID, CuisineTypeName) 
            VALUES (seq_CuisineTypeID.NEXTVAL, cuisineName);
            DBMS_OUTPUT.PUT_LINE('The cuisine type has been added successfully: ' || cuisineName);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error - Fail to add the cuisine type. Please check the input.');
        END;
    END IF;
END ADD_CUISINE_TYPE;
/



-- Procedure: ADD_RESTAURANT
CREATE OR REPLACE PROCEDURE ADD_RESTAURANT(
    cuisineID IN NUMBER, name IN VARCHAR2, address IN VARCHAR2,
    city IN VARCHAR2, state IN VARCHAR2, zip IN VARCHAR2
) IS
    c_count INTEGER; -- Check if the restaurant already exists
BEGIN
    SELECT COUNT(*)
    INTO c_count
    FROM Restaurants
    WHERE RestaurantName = name AND CuisineTypeID = cuisineID;

    IF c_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error - The restaurant already exists for this cuisine type.');
    ELSE
        BEGIN
            INSERT INTO Restaurants(
                RestaurantID, CuisineTypeID, RestaurantName,
                RestaurantStreetAddress, RestaurantCity, RestaurantState, RestaurantZip
            )
            VALUES (
                seq_RestaurantID.NEXTVAL, cuisineID, name, 
                address, city, state, zip
            );
            DBMS_OUTPUT.PUT_LINE('The restaurant has been successfully added: ' || name);
        EXCEPTION
            WHEN OTHERS THEN
                DBMS_OUTPUT.PUT_LINE('Error - Fail to add the restaurant. Kindly check the input.');
        END;
    END IF;
END ADD_RESTAURANT;
/




-- Procedure: DISPLAY_RESTAURANTS_BY_CUISINE
CREATE OR REPLACE PROCEDURE DISPLAY_RESTAURANTS_BY_CUISINE(cuisineName IN VARCHAR2) IS 
    cuisineID NUMBER;
BEGIN
    cuisineID := FIND_CUISINE_TYPE_ID(cuisineName);

    IF cuisineID IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Error - No cuisine type matches the input provided.');
    ELSE
        FOR rec IN (
            SELECT RestaurantName, RestaurantStreetAddress
            FROM Restaurants
            WHERE CuisineTypeID = cuisineID
        ) LOOP
            DBMS_OUTPUT.PUT_LINE('Restaurant: ' || rec.RestaurantName || ', Address: ' || rec.RestaurantStreetAddress);
        END LOOP;
    END IF;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error - An error occurred while showings display restaurants.');
END DISPLAY_RESTAURANTS_BY_CUISINE;
/




-- Procedure: REPORT_INCOME_BY_STATE
CREATE OR REPLACE PROCEDURE REPORT_INCOME_BY_STATE IS 
BEGIN
    FOR rec IN (
        SELECT CuisineTypeName, RestaurantState, COUNT(*) AS RestaurantCount, SUM(O.OrderAmountPaid) as Income
        FROM Restaurants R
        JOIN Cuisine_Type C ON R.CuisineTypeID = C.CuisineTypeID
        JOIN ORDERS O ON R.RestaurantID = O.RestaurantID
        GROUP BY CuisineTypeName, RestaurantState
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Cuisine: ' || rec.CuisineTypeName || ', State: ' || rec.RestaurantState 
        || ', Count: ' || rec.RestaurantCount || ', Total Income: ' || rec.Income);
        
    END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error - While processing the report, an error happened.');
END REPORT_INCOME_BY_STATE;
/

commit;



--Member 2 (Aji): Procedure Create Statements-------------------------------


--Procedure 1: Hire a Waiter
create or replace procedure Hire_Waiter(NWaiterName varchar2, NRestaurantID number, Restaurant_Name varchar2)
is restaurantIDgenerated number;
noIDgenerated exception;
begin 
restaurantIDgenerated := FIND_RESTAURANT_ID_2(Restaurant_Name);
 if restaurantIDgenerated > 0 then 
 insert into Waiters (
 WaiterID, 
RestaurantID,
    WaiterName )
    Values(
    seq_WaiterID.NEXTVAL ,
   restaurantIDgenerated,
    NWaiterName);
    
    dbms_output.put_line('Waiter Successfully Hired');
  else
    raise noIDgenerated;
    end if;
     exception
     when noIDgenerated then 
     dbms_output.put_line('No Restaurant ID has been generated');
     when value_error then 
     dbms_output.put_line('Invalid Data Input');
end;
/



create or replace procedure Report_Tips(NWaiterName in VARCHAR2)
is total_tips number;
waiter varchar(120);

begin 
select sum(OrderTip), WaiterName into total_tips, waiter from Orders JOIN Waiters ON (Orders.WaiterID = Waiters.WaiterID) where WaiterName = NWaiterName
group by WaiterName;
dbms_output.put_line('Total Tips earned by ' ||  waiter || ': ' || total_tips); 

if total_tips <= 0 then
dbms_output.put_line('Waiter earned no tips'); 
end if;

exception
when no_data_found then
dbms_output.put_line('Error Message: No Waiter Found');
end;
/



create or replace procedure ReportTips_ByState(NRestaurant_State in varchar2)
is total_tips number;
r_state varchar(120);
begin 
    select sum(OrderTip), RestaurantState into total_tips, r_state from Orders JOIN Restaurants ON (Orders.RestaurantID =  Restaurants.RestaurantID)
    where RestaurantState = NRestaurant_State
    group by RestaurantState;
            dbms_output.put_line('Total Tips earned by waiters in ' || r_state ||': '||  total_tips);
    if total_tips <= 0 then
        dbms_output.put_line('State earned no tips'); 
    end if;
exception
    when no_data_found then
       dbms_output.put_line('Error Message: State does not exist');
End;
/




create or replace procedure Waiter_list1(RestaurantID in number, Restaurant_Name in varchar)
is 
restaurantIDgenerated number;

begin 
 restaurantIDgenerated := FIND_RESTAURANT_ID_2(Restaurant_Name);
   if restaurantIDgenerated > 0 then 
   for R in(
   select WaiterID, WaiterName, RestaurantID 
      from Waiters 
      WHERE RestaurantID = restaurantIDgenerated)
      loop
      DBMS_output.put_line('Waiter ID: ' || R.WaiterID || '.' || ' Waiter Name: ' || R.WaiterName || '.' || ' Restaurant ID Waiter is working at: ' ||  R.RestaurantID); 
 end loop;
 else 
 raise no_data_found;
  end if;
Exception
    when no_data_found then
     dbms_output.put_line('');
end;
/



commit;


--Member 3 (): Procedure Create Statements--------------------------------


--CreateMenuItem
CREATE OR REPLACE PROCEDURE CreateMenuItem (
    p_MenuItemName IN VARCHAR2,
    p_CuisineName IN VARCHAR2,
    p_MenuItemPrice IN NUMBER
)
AS
    v_CuisineTypeID NUMBER;
    v_MenuItemExists NUMBER;
BEGIN
    -- Use FIND_CUISINE_TYPE_ID to retrieve the CuisineTypeID
    v_CuisineTypeID := FIND_CUISINE_TYPE_ID(p_CuisineName);

    IF v_CuisineTypeID IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid Cuisine Type Name.');
        RETURN;
    END IF;

    -- Check if MenuItemName already exists
    SELECT COUNT(*) INTO v_MenuItemExists
    FROM menu_items
    WHERE MenuItemName = p_MenuItemName;

    IF v_MenuItemExists > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Menu item already exists.');
        RETURN;
    END IF;

    -- Insert the menu item
    INSERT INTO menu_items (MenuItemsID, CuisineTypeID, MenuItemName, MenuItemPrice)
    VALUES (seq_menuitemsid.nextval, v_CuisineTypeID, p_MenuItemName, p_MenuItemPrice);

    DBMS_OUTPUT.PUT_LINE('Success: Menu item has been created.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred.');
END;
/



CREATE OR REPLACE PROCEDURE AddMenuItem(
    p_RestaurantName IN VARCHAR,
    p_MenuItemName IN VARCHAR,
    p_RestaurantInventoryQuantity IN NUMBER
) IS
    v_restaurant_count NUMBER;
    v_menuitem_count NUMBER;
    v_RestaurantID NUMBER;
    v_MenuItemsID NUMBER;
BEGIN
    --Get the CuisineTypeID based on the input cuisine type 
    v_RestaurantID := FIND_RESTAURANT_ID_2(p_RestaurantName);
    --If cuisine type not found exit procedure early with error message
    if v_RestaurantID = -1 then 
        dbms_output.put_line('Menu Item not able to be added');
        return;
    end if;
    
    --Get the CuisineTypeID based on the input cuisine type 
    v_MenuItemsID := FIND_MENU_ITEM_ID(p_MenuItemName);
    --If cuisine type not found exit procedure early with error message
    if v_MenuItemsID = -1 then 
        dbms_output.put_line('Menu Item not able to be added');
        return;
    end if;

    -- Insert into RestaurantInventory
    INSERT INTO restaurant_inventory (
        RestaurantInventoryID,
        RestaurantID,
        MenuItemsID,
        restaurantinventoryquantity
    ) VALUES (
        seq_restaurantinventoryid.nextval,
        v_RestaurantID,
        v_MenuItemsID,
        p_RestaurantInventoryQuantity
    );

    DBMS_OUTPUT.PUT_LINE('Menu item has been added to the restaurant inventory.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
/




--ReportMenuItems 
CREATE OR REPLACE PROCEDURE ReportMenuItems(p_CuisineTypeName IN VARCHAR) IS
    v_count NUMBER;
    v_CuisineTypeID NUMBER;
BEGIN
    --Get the CuisineTypeID based on the input cuisine type 
    v_CuisineTypeID := FIND_CUISINE_TYPE_ID_2(p_CuisineTypeName);
    --If cuisine type not found exit procedure early with error message
    if v_CuisineTypeID = -1 then 
        dbms_output.put_line('Report not able to be generated');
        return;
    end if;

    -- Fetch and display the menu items for the given CuisineTypeID
    FOR rec IN (
        SELECT MenuItemName, MenuItemPrice
        FROM Menu_Items
        WHERE CuisineTypeID = v_CuisineTypeID
    ) LOOP
        DBMS_OUTPUT.PUT_LINE('Name: ' || rec.MenuItemName || ', Price: ' || rec.MenuItemPrice);
    END LOOP;
END;
/



--UpdateInventory
CREATE OR REPLACE PROCEDURE UpdateInventory (
    p_RestaurantName IN VARCHAR2,
    p_MenuItemName IN VARCHAR2,
    p_ReductionAmount IN NUMBER
)
AS
    v_RestaurantID NUMBER;
    v_MenuItemID NUMBER;
    v_CurrentQuantity NUMBER;
BEGIN
    -- Retrieve IDs using helper functions
    v_RestaurantID := FIND_RESTAURANT_ID_2(p_RestaurantName);
    v_MenuItemID := FIND_MENU_ITEM_ID(p_MenuItemName);

    IF v_RestaurantID IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid Restaurant Name.');
        RETURN;
    END IF;

    IF v_MenuItemID = -1 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid Menu Item Name.');
        RETURN;
    END IF;

    -- Check current quantity
    BEGIN
        SELECT restaurantinventoryquantity INTO v_CurrentQuantity
        FROM restaurant_inventory
        WHERE RestaurantID = v_RestaurantID AND MenuItemsID = v_MenuItemID;

        IF v_CurrentQuantity < p_ReductionAmount THEN
            DBMS_OUTPUT.PUT_LINE('Error: Insufficient quantity.');
            RETURN;
        END IF;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Error: No inventory record found.');
            RETURN;
    END;

    -- Update inventory quantity
    UPDATE restaurant_inventory
    SET restaurantinventoryquantity = restaurantinventoryquantity - p_ReductionAmount
    WHERE RestaurantID = v_RestaurantID AND MenuItemsID = v_MenuItemID;

    DBMS_OUTPUT.PUT_LINE('Success: Inventory updated successfully.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: An unexpected error occurred.');
END;
/




commit;




--Member 4 (Andrew): Procedure Create Statements--------------------------------


create or replace procedure Add_Customer(
    CustName in varchar2,
    CustEmail in varchar2,
    CustAddress in varchar2,
    CustCity in varchar2,
    CustState in varchar2,
    CustZip in varchar2,
    CustCCN in varchar2
)
is
    CustCount number;
begin
    -- Validate inputs for missing or invalid data
    if CustName is null or length(CustName) > 120 or
       CustEmail is null or length(CustEmail) > 120 or
       CustAddress is null or length(CustAddress) > 130 or
       CustCity is null or length(CustCity) > 60 or
       CustState is null or length(CustState) > 60 or
       CustZip is null or length(CustZip) > 30 or
       CustCCN is null or length(CustCCN) > 30 then
        dbms_output.put_line('Error: Invalid input. Check your inputs.');
        return;
    end if;

    -- Check if the customer already exists (based on exact match of all fields except customer ID)
    select count(*) into CustCount
    from Customers
    where CustomerName = CustName
      and CustomerEmail = CustEmail
      and CustomerStreetAddress = CustAddress
      and CustomerCity = CustCity
      and CustomerState = CustState
      and CustomerZip = CustZip
      and CustomerCreditCardNumber = CustCCN;

    if CustCount > 0 then
        dbms_output.put_line('Error: Customer with the same information already exists.');
        RETURN;
    end if;

    -- Insert the new customer into the Customers table
    insert into Customers (CustomerID, CustomerName, CustomerEmail, CustomerStreetAddress, CustomerCity, CustomerState, CustomerZip, CustomerCreditCardNumber
    )
    values (
        seq_CustomerID.nextval, CustName, CustEmail, CustAddress, CustCity, CustState, CustZip, CustCCN
    );

    -- Confirmation message
    dbms_output.put_line('Customer added successfully with CustomerID: ' || seq_CustomerID.currval);
end;
/





create or replace procedure Place_Order(
    o_RestaurantName in varchar2,
    o_WaiterName in varchar2,
    o_MenuItem in varchar2,
    o_CustomerName in varchar2,
    o_OrderAmount in number,
    o_OrderTip in number
)
is
    f_RestaurantID number;
    f_WaiterID number;
    f_MenuItemID number;
    f_CustomerID number;
    i_OrderID number;
begin
    -- Validate inputs for nulls or invalid lengths
    IF o_RestaurantName is null or length(o_RestaurantName) > 120 or
       o_WaiterName is null or length(o_WaiterName) > 120 or
       o_MenuItem is null or length(o_MenuItem) > 150 or
       o_CustomerName is null or length(o_CustomerName) > 120 or
       o_OrderAmount is null or o_OrderAmount <= 0 or
       o_OrderTip is null or o_OrderTip < 0 then
        dbms_output.put_line('Error: Invalid input. Please check your data.');
        return;
    end if;

    -- Retrieve IDs using helper functions
    f_RestaurantID := FIND_RESTAURANT_ID_2(o_RestaurantName);
    if f_RestaurantID = -1 then
        dbms_output.put_line('Error: Restaurant "' || o_RestaurantName || '" does not exist.');
        return;
    end if;

    f_WaiterID := FIND_WAITER_ID(o_WaiterName);
    if f_WaiterID = -1 then
        dbms_output.put_line('Error: Waiter "' || o_WaiterName || '" does not exist.');
        return;
    end if;

    f_MenuItemID := FIND_MENU_ITEM_ID(o_MenuItem);
    if f_MenuItemID = -1 then
        dbms_output.put_line('Error: Menu item "' || o_MenuItem || '" does not exist.');
        return;
    end if;

    f_CustomerID := FIND_CUSTOMER_ID(o_CustomerName);
    if f_CustomerID = -1 then
        dbms_output.put_line('Error: Customer "' || o_CustomerName || '" does not exist.');
        return;
    end if;
    
    select seq_OrderID.nextval into i_OrderID from dual;

    -- Insert the order into the Orders table
    insert into Orders (OrderID, RestaurantID, WaiterID, MenuItemID, CustomerID, OrderAmountPaid, OrderTip)
    values (i_OrderID, f_RestaurantID, f_WaiterID, f_MenuItemID, f_CustomerID, o_OrderAmount, o_OrderTip);

    -- Confirmation message
    dbms_output.put_line('Order successfully placed.');
end;
/





create or replace procedure list_orders (
    o_restaurantname in varchar2,
    o_date in date
)
is
    o_restaurantid number;
    o_ordercount number;
begin
    -- validate inputs
    if o_restaurantname is null or o_date is null then
        dbms_output.put_line('Error: missing inputs. please provide both restaurant name and date.');
        return;
    elsif length(o_restaurantname) > 120 then
        dbms_output.put_line('Error: restaurant name exceeds maximum length.');
        return;
    end if;

    -- get the restaurantid using the FIND_RESTAURANT_ID helper function
    o_restaurantid := FIND_RESTAURANT_ID_2(o_restaurantname);

    if o_restaurantid = -1 then
        dbms_output.put_line('Error: invalid restaurant name.');
        return;
    end if;

    -- check if there are orders for the given date
    select count(*) into o_ordercount
    from Orders
    where RestaurantID = o_restaurantid
    and trunc(OrderDate) = trunc(o_date);
    
    if o_ordercount = 0 then
        dbms_output.put_line('Error: no orders found for the specified restaurant and date.');
        return;
    end if;

    -- display the orders
    for r in (
        select 
            OrderID, WaiterID, MenuItemID, CustomerID, OrderAmountPaid, OrderTip
        from Orders
        where restaurantid = o_restaurantid
        and trunc(OrderDate) = trunc(o_date)
    )
    loop
        dbms_output.put_line('OrderID: ' || r.OrderID || ', WaiterID: ' || r.WaiterID || 
                             ', MenuItemID: ' || r.MenuItemID || ', CustomerID: ' || r.CustomerID || 
                             ', Amount Paid: ' || r.OrderAmountPaid || ', Tip: ' || r.OrderTip);
    end loop;
end;
/



    
create or replace procedure Top_Three_Report
is
    t_restaurantcount NUMBER := 0;
    t_ordercount NUMBER := 0;
    -- Cursor to fetch top 3 restaurants by state
    cursor c_topthreereport is
        select r.RestaurantName, 
               r.RestaurantState, 
               sum(o.OrderAmountPaid) as TotalPaid
        from Restaurants r
        join Orders o on r.RestaurantID = o.RestaurantID
        group by r.RestaurantName, r.RestaurantState
        order by r.RestaurantState, TotalPaid desc;

    t_state varchar2(60) := null;
    t_restcount number := 0;
begin
    -- Check if there are any restaurants
    select count(*) into t_restcount from Restaurants;
    if t_restcount = 0 then
        dbms_output.put_line('Error: No restaurants available to report.');
        return;
    end if;

    -- Check if there are any orders
    select count(*) into t_ordercount from Orders;
    if t_ordercount = 0 then
        dbms_output.put_line('Error: No orders available to report.');
        return;
    end if;

    -- Process the cursor
    for r in c_topthreereport loop
        -- If entering a new state, reset the counter and print the state name
        if t_state is null or t_state != r.RestaurantState then
            t_state := r.RestaurantState;
            t_restcount := 0;

            dbms_output.put_line('--- State: ' || t_state || ' ---');
        end if;

        -- Display up to 3 restaurants per state
        if t_restcount < 3 then
            dbms_output.put_line('Restaurant: ' || r.RestaurantName || 
                                 ', Total Paid: ' || r.TotalPaid);
            t_restcount := t_restcount + 1;
        end if;
    end loop;

    -- if no states were reported, display an error
    if t_state is null then
        dbms_output.put_line('Error: No data to report on.');
    end if;
end;
/


-- Test Top_Three_Report

BEGIN
    -- Lists out top restaurants in the state, total paid by the customers.
    Top_Three_Report();
END;
/



commit;




--Member 5 (): Procedure Create Statements--------------------------------

--ADD_REVIEW PROCEDURE
create or replace procedure ADD_REVIEW(p_RestaurantName in
varchar, Reviewer_Email in varchar, Num_Of_Stars in number, Review_Text in varchar)
is 
    --Variable to hold the retrived restaurant ID
    RetrievedID number;
begin
    --Find the ID for the given restaurant
    RetrievedID := FIND_RESTAURANT_ID_2(p_RestaurantName);
    
    --If resturant not found than exit procedure
    --error message comes from helper function
    if RetrievedID = -1 then
        dbms_output.put_line('Review not able to be added for ' || p_restaurantname);
        Return;
    end if;
    
    --Insert the review into the table
    insert into Reviews values(seq_ReviewID.NEXTVAL, RetrievedID, Reviewer_Email, Num_Of_Stars, Review_Text);
    
    --Output statement to notify user of successful entry
     dbms_output.put_line('Review Successfully added for  ' || p_restaurantname);
exception
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid datatype. Input must be numeric.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected error occurred: ' || SQLERRM);
end;
/


--RECOMMEND_TO_CUSTOMER PROCEDURE
create or replace procedure RECOMMEND_TO_CUSTOMER (p_CustomerID in number, p_CuisineType in varchar2)
is
    --Variable creation
    v_CuisineTypeID number;
    v_RestaurantID number;
    v_RecommendedRestaurantID number;
    v_RestaurantName varchar(120);
    --Variable to check is customer exists
    v_CustomerExists number;
    --Varible to chech if customer has visited a restaurant
    v_VisitCount number;
    --Variable to check if customer has order from entered cuisine type
    v_CusineTypeOrderCheck number;
    
begin
    --Check if customer exists
    v_CustomerExists := 0;
    select count(*) into v_CustomerExists
    from Customers where CustomerID = p_CustomerID;
    if v_CustomerExists = 0 then 
        dbms_output.put_line('Customer ID not found');
        dbms_output.put_line('No reccomendations able to be made');
        RETURN;
    end if;
    
    --Get the CuisineTypeID based on the input cuisine type 
    v_CuisineTypeID := FIND_CUISINE_TYPE_ID_2(p_CuisineType);
    --If cuisine type not found exit procedure early with error message
    if v_CuisineTypeID = -1 then 
        dbms_output.put_line('No reccomendations able to be made for customer');
        return;
    end if;
    
    --Check if customer has an order for the entered cuisine type
    v_CusineTypeOrderCheck := 0;
    select count(*)
    into v_CusineTypeOrderCheck
    from Orders o
    join Restaurants r on o.RestaurantID = r.RestaurantID
    join Cuisine_Type ct on r.CuisineTypeID = ct.CuisineTypeID
    where o.CustomerID = p_CustomerID
    and r.CuisineTypeID = v_CuisineTypeID;
    
    --If no order found exit procedure early with error message
    if v_CusineTypeOrderCheck = 0 then 
        dbms_output.put_line('Customer has not visted a restaurant of this cuisine type');
        dbms_output.put_line('No reccomendations able to be made for customer');
        return;
    end if;

    --Loop through all restaurants for the given cuisine type, sorted by the highest average rating
    --Also selects nessacary information for reccomendation
    for rec in (
        select r.RestaurantID
        from Restaurants r
        join Reviews rev on r.RestaurantID = rev.RestaurantID
        where r.CuisineTypeID = v_CuisineTypeID
        group by r.RestaurantID
        order by avg(rev.StarGiven) desc
    ) loop
        v_RestaurantID := rec.RestaurantID;

        --Check if the customer has ordered from (visited) this restaurant
        select count(*)
        into v_VisitCount
        from Orders o
        where o.CustomerID = p_CustomerID
        and o.RestaurantID = v_RestaurantID;

        -- If the customer has not visited the restaurant recommend it, if not loop through again
        if v_VisitCount = 0 then
            -- Recommend the restaurant by inserting into the Recommendations table
            v_RecommendedRestaurantID := v_RestaurantID;
            
            -- Insert the recommendation into the Recommendations table
            insert into Recommendations values(seq_RecommendationID.NEXTVAL, p_CustomerID, v_RecommendedRestaurantID, sysdate);
            
            select RestaurantName into v_RestaurantName 
            from Restaurants where RestaurantID = v_RecommendedRestaurantID;
            dbms_output.put_line('Customer was recommended to visit ' || v_RestaurantName);
            
            commit; -- Commit the recommendation
            exit; -- Exit the loop after recommending the restaurant
        end if;
    end loop;

    -- If the loop ends without finding a recommendation, it means the customer has visited all the top restaurants
    if v_RecommendedRestaurantID is null then
        dbms_output.put_line('Customer has visisted all resturants of this cuisine type with reviews');
        dbms_output.put_line('No reccomendations able to be made for customer');
    end if;
end RECOMMEND_TO_CUSTOMER;
/



--BUY_OR_BEWARE PROCEDURE
create or replace procedure BUY_OR_BEWARE (X in number) 
is
    --Variable to count how many resturants have already been printed
    Count_Of_Prints number;
    --Amount of restaurnats with at least one review to output incase of exception
    Count_Reviewed_Restaurants number;
begin
    --Selecting the count of valid restaurnts into its variable
    select count(distinct r.RestaurantID) into Count_Reviewed_Restaurants
    from Restaurants res
    join Reviews r on res.RestaurantID = r.RestaurantID;
    
    --Exception handling if the entered number is larger than the amount of valid restaurants
    if X > (Count_Reviewed_Restaurants) then
        dbms_output.put_line('Number too large!');
        dbms_output.put_line('Input number can be no greater than ' || (Count_Reviewed_Restaurants));
        return;
    end if;

    -- TOP RATED RESTAURANTS
    --Intial output statements
    dbms_output.put_line('Top rated restaurants');
    dbms_output.put_line('Avg Stars|Restaurant ID|Restaurants Name|Cuisine Type|Std Dev of Stars');
    
    --Varibale intialization
    Count_Of_Prints := 0;
    
    --For loop header to sort valid restaurnts by highest average stars
    --this select statement also selects all required information for the output
    for rec in (
        select avg(r.StarGiven) as avg_stars,
               r.RestaurantID,
               res.RestaurantName,
               ct.CuisineTypeName,
               stddev(r.StarGiven) as stddev_stars
        from Reviews r
        join Restaurants res on r.RestaurantID = res.RestaurantID
        join Cuisine_Type ct on res.CuisineTypeID = ct.CuisineTypeID
        group by r.RestaurantID, res.RestaurantName, ct.CuisineTypeName
        order by avg_stars desc
    ) loop
        --iterate the count variable
        Count_Of_Prints :=  Count_Of_Prints + 1;
        
        --output nessacary information
        dbms_output.put_line(to_char(rec.avg_stars, '9.99') || ' | ' || rec.RestaurantID || ' | ' 
        || rec.RestaurantName || ' | ' || rec.CuisineTypeName || ' | ' 
        || to_char(rec.stddev_stars, '9.99'));
        --exit loop when max specified number is reached
        exit when Count_Of_Prints >= X;
    end loop;

    -- Buyer Beware: Worst Rated Restaurants
    --Intial output statements
    dbms_output.put_line('Buyer Beware: Stay Away from...');
    dbms_output.put_line('Avg Stars|Restaurant ID|Restaurants Name|Cuisine Type|Std Dev of Stars');
    
     --Varibale intialization
    Count_Of_Prints := 0;
    
    --For loop header to sort valid restaurnts by highest average stars
    --this select statement also selects all required information for the output
    for rec in (
        select avg(r.StarGiven) as avg_stars,
               r.RestaurantID,
               res.RestaurantName,
               ct.CuisineTypeName,
               stddev(r.StarGiven) as stddev_stars
        from Reviews r
        join Restaurants res on r.RestaurantID = res.RestaurantID
        join Cuisine_Type ct on res.CuisineTypeID = ct.CuisineTypeID
        group by r.RestaurantID, res.RestaurantName, ct.CuisineTypeName
        order by avg_stars asc
    ) loop
        --iterate the count variable
        Count_Of_Prints :=  Count_Of_Prints + 1;
        
        --output nessacary information
        dbms_output.put_line(to_char(rec.avg_stars, '9.99') || ' | ' || rec.RestaurantID || ' | ' || rec.RestaurantName || ' | ' || rec.CuisineTypeName || ' | ' || to_char(rec.stddev_stars, '9.99'));
        --exit loop when max specified number is reached
        exit when Count_Of_Prints >= X;
    end loop;
end BUY_OR_BEWARE;
/


--LIST_RECCOMENDATIONS PROCEDURE
create or replace procedure LIST_RECOMMENDATIONS as
    data_check number;
begin
    --intialize variable
    data_check := 0;
    --Check if recommendations table has data in it
    select count(*) into data_check from recommendations;
    if data_check = 0 then
        dbms_output.put_line('No recommendations to be listed');
    end if;


    -- Generate the report of recommendations
    for rec in (
        select 
            c.CustomerName as Customer_Name,
            res.RestaurantName as Recommended_Restaurant,
            ct.CuisineTypeName as Cuisine_Type,
            round(avg(rv.StarGiven), 2) as Average_Stars
        from 
            Recommendations recs
            join Customers c on recs.CustomerID = c.CustomerID
            join Restaurants res on recs.RestaurantID = res.RestaurantID
            join Cuisine_Type ct on res.CuisineTypeID = ct.CuisineTypeID
            left join Reviews rv on rv.RestaurantID = res.RestaurantID
        group by 
            c.CustomerName, 
            res.RestaurantName, 
            ct.CuisineTypeName
        order by 
            c.CustomerName
            
    ) loop
        -- Print the neseccary parameters for each recommendation
        dbms_output.put_line(
            'Customer: ' || rec.Customer_Name ||
            ', Recommended Restaurant: ' || rec.Recommended_Restaurant ||
            ', Cuisine Type: ' || rec.Cuisine_Type ||
            ', Average Stars: ' || rec.Average_Stars
        );
    end loop;
end;
/

commit;







--Member 1 (1): Procedure Test Statements---------------------------------

-- Test ADD_CUISINE_TYPE
--show before
SELECT * FROM Cuisine_Type;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Test ADD_CUISINE_TYPE:');
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Normal case - Adding a valid new cuisine
    ADD_CUISINE_TYPE('Vietnamese');
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Special case - Adding a duplicate cuisine
    ADD_CUISINE_TYPE('American');
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Special case - Exceeds Maximum Character #
    ADD_CUISINE_TYPE('YouKnowVeryWellThisCuisineNameIsLong');

END;
/
-- Show how you know there's an update
SELECT * FROM Cuisine_Type;




-- Test ADD_RESTAURANT
SELECT * FROM Restaurants;


BEGIN
    DBMS_OUTPUT.PUT_LINE(' Test ADD_RESTAURANT');
    
    -- Normal case - Adding a valid restaurant
    ADD_RESTAURANT(1, 'Outback Steakhouse', 'Road of all roads', 'Ellicott City', 'MD', '21082');
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Special case - Adding a duplicate restaurant for the same cuisine
    ADD_RESTAURANT(1, 'Liberty Grille', '10454 Faulkner Ridge', 'Glen Burnie', 'MD', '21061');
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Special Case: Invalid Cuisine ID
    ADD_RESTAURANT(1000, ' Unknown Yahoo', '999 Police Road', 'Bowie', 'MD', '21001');
    
  
END;
/

-- Show how you know
SELECT * FROM Restaurants;




-- Test DISPLAY_RESTAURANTS_BY_CUISINE
BEGIN
    DBMS_OUTPUT.PUT_LINE(' Test DISPLAY_RESTAURANTS_BY_CUISINE');
    
    -- Success case - Display restaurants for an existing cuisine
    DISPLAY_RESTAURANTS_BY_CUISINE('American');
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
    -- Special case: Non-existent cuisine
    DISPLAY_RESTAURANTS_BY_CUISINE('ThisCuisineDoesNotExist');
    
   
END;
/



-- Test REPORT_INCOME_BY_STATE
BEGIN
    DBMS_OUTPUT.PUT_LINE('Test REPORT_INCOME_BY_STATE');
    
    -- Success case: Generate report
    REPORT_INCOME_BY_STATE;
END;
/



--Member 2 (Aji): Procedure Test Statements-------------------------------

--output before
Select * from Waiters; 

--normal case
exec Hire_Waiter('Thariwa', 3, 'Fire and Flavor'); 

--special case 1: Restaurant does not exist
exec Hire_Waiter('Yamou', 0, 'Liberty');

-- output after procedure
Select * from Waiters; 



--normal case
exec REPORT_TIPS( 'Aji Fatou Gai');

--waiter does not exist
exec Report_Tips('Jarra');



 --normal case
exec ReportTips_ByState('MD');

--special case: state does not exist
exec ReportTips_ByState('Columbia'); 



--normal case: returns output of waiter list
exec Waiter_list1(4, 'Grill Masters BBQ');  

--special case: restaurant does not exist
exec Waiter_list1(4, 'Grill');



--Member 3: Procedure Test Statements--------------------------------

--Test Cases:
SELECT * FROM MENU_ITEMS mi
JOIN CUISINE_TYPE ct ON mi.cuisinetypeid = ct.cuisinetypeid
WHERE ct.cuisinetypename = 'Italian';

-- successfully adding a item 
EXEC CreateMenuItem('Pasta Carbonara', 'Italian', 12.99);

-- putting a duplicate item
EXEC CreateMenuItem('Pasta Carbonara', 'Italian', 12.99);

SELECT * FROM MENU_ITEMS mi
JOIN CUISINE_TYPE ct ON mi.cuisinetypeid = ct.cuisinetypeid
WHERE ct.cuisinetypename = 'Italian';




--Test cases:
SELECT mi.MenuItemName, RESTAURANTINVENTORYQUANTITY 
FROM RESTAURANT_INVENTORY ri
JOIN Menu_Items mi ON ri.menuitemsid = mi.menuitemsid
WHERE RestaurantID = 1;

-- normal case
EXEC AddMenuItem('Liberty Grille', 'Pasta Carbonara', 50);

--if restaurant name is invalid
EXEC AddMenuItem('no restaurant', 'Pasta Carbonara', 50);


SELECT mi.MenuItemName, RESTAURANTINVENTORYQUANTITY 
FROM RESTAURANT_INVENTORY ri
JOIN Menu_Items mi ON ri.menuitemsid = mi.menuitemsid
WHERE RestaurantID = 1;



--Test Cases:
--Normal case
EXEC ReportMenuItems('Italian');
-- invalid cuisine name
EXEC ReportMenuItems('no cuisine ');




--Test Cases: 
--Normal case
EXEC UpdateInventory('Liberty Grille', 'Pasta Carbonara', 10);
--if reduction amount exceeds amount
EXEC UpdateInventory('Liberty Grille', 'Pasta Carbonara', 100);

Select * from restaurant_inventory where restaurantID = 1;




--Member 4 (Andrew): Procedure Test Statements--------------------------------

-- Test Add_Customer
SELECT * FROM Customers;

BEGIN
        -- CustName, CustEmail, CustAddress, CustCity, CustState, CustZip, CustCCN
    Add_Customer('John Thompson', 'jthom@umbc.edu', '10000 Hilltop Circle', 'Catonsville', 'MD', 21228, 111133322222);
    Add_Customer('John Smith', 'jsmith@umbc.edu', '10000 Hilltop Circle', 'Catonsville', 'MD', 21228, 111122222222);
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
    
        -- Duplicate of Customer
    Add_Customer('John Thompson', 'jthom@umbc.edu', '10000 Hilltop Circle', 'Catonsville', 'MD', 21228, 111133322222);      
END;
/
SELECT * FROM Customers;



-- Test Place_Order
SELECT * FROM Orders;

BEGIN
        -- RestaurantName, WaiterName, MenuItem, CustomerName, OrderAmount, OrderTip
    Place_Order('Grill Masters BBQ', '1', 'Burger', 'John Smith', 25.99, 5.00);
    Place_Order('Grill Masters BBQ', 'Andrew Hollander', 'Pork Loin', 'John Thompson', 20.99, 1.00);
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
        -- Restaurant doesn't exist
    Place_Order('Grill Masters Restaurant', 'Andrew Hollander', 'Pork Loin', 'John Thompson', 20.99, 1.00);
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
        -- Other non-existant inputs
    Place_Order('Grill Masters BBQ', 'Andrew Holland', 'Pork Loin', 'John Thompson', 20.99, 1.00);
    Place_Order('Grill Masters BBQ', 'Andrew Hollander', 'Pork', 'John Thompson', 20.99, 1.00);
    Place_Order('Grill Masters BBQ', 'Andrew Hollander', 'Pork Loin', 'John', 20.99, 1.00);
    
    --Blank Line
    DBMS_OUTPUT.PUT_LINE('');
        -- Invalid input (bill is zero dollars)
    Place_Order('Grill Masters BBQ', 'Andrew Hollander', 'Pork Loin', 'John Thompson', 0, 1.00);
END;
/
SELECT * FROM Orders;



--Test List orders
BEGIN
        -- Restaurant Name, Date
    List_Orders('Grill Masters BBQ', TO_DATE('2024-12-03', 'YYYY-MM-DD'));
        -- No orders on that date
    List_Orders('Grill Masters BBQ', TO_DATE('2024-11-28', 'YYYY-MM-DD'));
        -- Invalid restaurant name
    List_Orders('Grill Masters Restaurant', TO_DATE('2024-11-28', 'YYYY-MM-DD'));
END;
/


-- Test Top_Three_Report
BEGIN
    -- Lists out top restaurants in the state, total paid by the customers.
    Top_Three_Report();
END;
/




--Member 5 (): Procedure Test Statements--------------------------------

--ADD_REVIEW TEST CASES

--Step 1 show current reviews for reference
select * from reviews;

--Step 2 run test cases of procedure use
begin
    --Normal Case, review should be added to table
    dbms_output.put_line('Normal Case:');
    ADD_REVIEW('Fire and Flavor', 'geraldwinslow@gmail.com', 4, 'Very good food, good service');
    
    --Special Case, restaurant dosen't exist and error message is output
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');  
    ADD_REVIEW('Non-Existent Restaurant', 'markhunt@gmail.com', 3, 'ok food, good prices');
end;
/
--Step 3 show updated reviews rows
select * from reviews;


--RECOMMEND_TO_CUSTOMER TEST CASES

--Step 1 show current recommendations for reference
select * from recommendations;

--Step 2 run test cases of procedure use
begin
    --Normal Case, Valid info is added and the recommendation is made
    dbms_output.put_line('Normal Case:');
    RECOMMEND_TO_CUSTOMER(4,'BBQ');
    
    --Special Case, Cuisine type customer has not visted
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');
    RECOMMEND_TO_CUSTOMER(2,'Italian');
    
    --Special Case, Customer does not exist
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');
    RECOMMEND_TO_CUSTOMER(25,'BBQ');
    
    --Special Case, Cuisine Type does not exist
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');
    RECOMMEND_TO_CUSTOMER(1,'Mexican');
    
    --Customer has visted every restuarnt of specified cuisne type
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');
    RECOMMEND_TO_CUSTOMER(3,'BBQ');
end;
/
--Step 3 show updated recommendations rows
select * from recommendations;



--BUY_OR_BEWARE TEST CASES
begin
    --Normal Case, Valid number is input and procedure is ran
    dbms_output.put_line('Normal Case:');
    BUY_OR_BEWARE(3);
    
    --Special Case, Number too large is input
    --procedure responds with the max value acceptable
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:'); 
    BUY_OR_BEWARE(100);
end;
/


--TABLE CREATION FOR SPECIAL TEST CASE
CREATE TABLE Recommendations_Test (
    RecommendationID NUMBER PRIMARY KEY,
    CustomerID NUMBER references Customers(CustomerID),
    RestaurantID NUMBER references Restaurants(RestaurantID),
    RecommendationDate DATE
);


--LIST_RECCOMENDATIONS PROCEDURE SPECIAL TEST CASE
create or replace procedure LIST_RECOMMENDATIONS_TEST as
    data_check number;
begin
    --intialize variable
    data_check := 0;
    --Check if recommendations table has data in it
    select count(*) into data_check from recommendations_test;
    if data_check = 0 then
        dbms_output.put_line('No recommendations to be listed');
    end if;


    -- Generate the report of recommendations
    for rec in (
        select 
            c.CustomerName as Customer_Name,
            res.RestaurantName as Recommended_Restaurant,
            ct.CuisineTypeName as Cuisine_Type,
            round(avg(rv.StarGiven), 2) as Average_Stars
        from 
            Recommendations_test recs
            join Customers c on recs.CustomerID = c.CustomerID
            join Restaurants res on recs.RestaurantID = res.RestaurantID
            join Cuisine_Type ct on res.CuisineTypeID = ct.CuisineTypeID
            left join Reviews rv on rv.RestaurantID = res.RestaurantID
        group by 
            c.CustomerName, 
            res.RestaurantName, 
            ct.CuisineTypeName
        order by 
            c.CustomerName
            
    ) loop
        -- Print the neseccary parameters for each recommendation
        dbms_output.put_line(
            'Customer: ' || rec.Customer_Name ||
            ', Recommended Restaurant: ' || rec.Recommended_Restaurant ||
            ', Cuisine Type: ' || rec.Cuisine_Type ||
            ', Average Stars: ' || rec.Average_Stars
        );
    end loop;
end;
/

--LIST_RECOMMENDATION TEST CASES
begin 
    --Normal Case data exists and report is made
    dbms_output.put_line('Normal Case:');
    LIST_RECOMMENDATIONS();
    
    --Special Case, this would occur is no data exists but the call is the same
    --To test this case I made a second table with no data
    --I then made a second procedure and linked that table to this procedure
    dbms_output.put_line('');
    dbms_output.put_line('Special Case:');
    LIST_RECOMMENDATIONS_TEST();
end;
/
