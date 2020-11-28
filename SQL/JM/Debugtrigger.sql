insert into likes values(default,'1','h','1');
insert into likes values(default,'1','r','1');
insert into likes values(default,'1','s','1');
delete from likes;
select shop_likes from hairshop;
select review_likes from review;
select style_likes from style;

create or replace trigger likes_plus_tri
    AFTER DELETE ON likes
    for each row
    begin
        if :OLD.like_type  = 'h' THEN
            update HAIRSHOP set  shop_likes = shop_likes - 1 where shop_no = :OLD.like_type_no;
        ELSIF :OLD.like_type = 'r' THEN
            update review set  review_likes = review_likes - 1  where review_no = :OLD.like_type_no;
        ELSIF :OLD.like_type = 's' THEN
            update style set style_likes = style_likes - 1 where style_no = :OLD.like_type_no;
        END IF;
    end;
    /

create or replace trigger likes_minus_tri
    AFTER INSERT ON likes
    for each row
    begin
        if :NEW.like_type  = 'h' THEN
            update HAIRSHOP set  shop_likes = shop_likes +1 where shop_no = :NEW.like_type_no;
        ELSIF :NEW.like_type = 'r' THEN
            update review set  review_likes = review_likes +1  where review_no = :NEW.like_type_no;
        ELSIF :NEW.like_type = 's' THEN
            update style set style_likes = style_likes + 1 where style_no = :NEW.like_type_no;
        END IF;
    end;
    /
