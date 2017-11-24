select * from t_goods_info;
select * from t_goods_detail_image;

select * from t_shoping_member;

select * from t_shoping_cart;


select * from t_shoping_order;


delete from t_shoping_cart
where cart_id=13;


commit;
rollback;

--키워드 저장 테이블 생성
create table t_shoping_keyword(
   kCode varchar2(0) primary key,
   kName varchar2(40),
   kRegDate date,
   goods_id  varchar2(30)
);

select * from t_shoping_keyword;
select * from t_shoping_keyword
where 
kName like '%입문%';



select g.*,i.FILENAME as goods_fileName 
from t_goods_info g,t_goods_detail_image i, t_shoping_keyword k
where 
g.goods_id=i.goods_id
and g.goods_id=k.goods_id
and i.fileType='main_image'
--and k.kName='초보';
and k.kName like '%입문%';

--입문단어가 들어가는 모든 키워드를 출력하라.
--입문자,입문서,...자바입문서
-- %입문%

select * from t_goods_info
where goods_title like'%완벽하지 않은 것들에 대한 사랑%';


select g.*,d.fileName from t_goods_info g, t_goods_detail_image d
           where g.goods_id=d.goods_id
           and d.filetype='main_image'
           and g.goods_title like '%완벽하지 않은 것들에 대한 사랑%'
           order by g.goods_creDate desc;
           
select * from t_goods_detail_image;
--where 
--goods_id='309'
--and filetype='main_image';

           
           
select * from t_shoping_cart;
delete from t_shoping_cart
where cart_id=8;

select g.*,d.fileName from t_goods_info g, t_goods_detail_image d
	                                where g.goods_id=d.goods_id
	                                and d.filetype='main_image'
	                                and g.goods_id='340'
	                                 order by g.goods_creDate desc;
                                     
select decode(max(cart_id),null,1,
              max(cart_id)+1) as pk 
from t_shoping_cart;

----비로그인 시 장바구니와 로그인 시 장바구니 동기화 프로시저
--create or replace
--package bookshop_cart as
--  type cursorType is ref cursor;
--  type arr_goods_id is table OF varchar2(50); -- ARRAY OF STRING
--
--  procedure proc_addCartFromCookie(
--     pi_list_cookie in arr_goods_id ,
--     po_cursor out cursorType);
--end bookshop_cart;
--
----procedure proc_addCartFromCookie(
----     pi_list_cookie in arr_goods_id ,
----     po_cursor out cursorType);
----     
----프로시저 생성
--CREATE OR REPLACE PROCEDURE  bookshop_cart.proc_addCartFromCookie
--(
-- pi_list_cookie in arr_goods_id ,
-- po_cursor out cursorType
--)
--AS
--I BINARY_INTEGER;
--BEGIN
--   FOR I IN 1 .. pi_list_cookie.COUNT
--   LOOP
--      DBMS_OUTPUT.PUT_LINE(pi_list_cookie(I));
--   END LOOP;
--  -- COMMIT;
--END;

drop table t_shoping_reco;

create table t_shoping_reco(
   reco_id number(10) primary key,
   user_review_point number(10),
   goods_hit_point number(10),
   expert_eval_point number(10),
   sales_index number(10),
   reco_goods_id varchar2(10),
   regDate date,
   member_id varchar2(10),
   goods_id varchar2(10)
);

select * from t_shoping_reco;

insert into t_shoping_reco(reco_id,
                           user_review_point,
                           goods_hit_point,
                           expert_eval_point,
                           sales_index,
                           reco_goods_id,
                           regDate,
                           member_id,
                           goods_id)
              values(seq_reco_id.nextval,
                     1000,
                     1000,
                     1000,
                     1000,
                     342,
                     sysdate,
                     'hong',
                     343              
                    );
                    
insert into t_shoping_reco(reco_id,
                           user_review_point,
                           goods_hit_point,
                           expert_eval_point,
                           sales_index,
                           reco_goods_id,
                           regDate,
                           member_id,
                           goods_id)
              values(seq_reco_id.nextval,
                     1000,
                     1000,
                     1000,
                     1000,
                     300,
                     sysdate,
                     'hong',
                     343              
                    );
                    
insert into t_shoping_reco(reco_id,
                           user_review_point,
                           goods_hit_point,
                           expert_eval_point,
                           sales_index,
                           reco_goods_id,
                           regDate,
                           member_id,
                           goods_id)
              values(seq_reco_id.nextval,
                     1000,
                     1000,
                     1000,
                     1000,
                     308,
                     sysdate,
                     'hong',
                     343              
                    );
                    
select * from t_shoping_reco;
commit;
       
 select t.*
          from(
			select g.*,d.fileName from t_goods_info g, t_goods_detail_image d
        	where g.goods_id=d.goods_id 
        	and d.filetype='main_image'
        	and goods_type=#{goods_type}
            order by g.goods_creDate desc)  t
	             
	             where   rowNum <12                       ;

select g.*,d.fileName from t_goods_info g, t_goods_detail_image d
        	where g.goods_id=d.goods_id 
        	and d.filetype='main_image'
        	and g.goods_id in(select reco_goods_id from t_shoping_reco
                               where goods_id=343 )
            order by g.goods_creDate desc;                 
                           

select reco_goods_id from t_shoping_reco
where goods_id=343;

select * from t_shoping_reco
where reco_goods_id in (select reco_goods_id 
                        from t_shoping_reco
                        where goods_id=343);


select * from t_shoping_reco;
