-- Select the names of the cats and the names of the shops they belong to
SELECT cats.name as cat_name, shops.shopname as shop_name
FROM cats  -- From the table of cats
JOIN shops ON shops.id = cats.shops_id;  -- Join it with the table of shops based on the shop id


-- Select the name of the shop that sells the cat named "Murzik"
SELECT shops.shopname as shop_name
FROM cats  -- From the table of cats
JOIN shops ON shops.id = cats.shops_id  -- Join it with the table of shops based on the shop id
WHERE cats.name = "Murzik";  -- Where the name of the cat is "Murzik"

-- Select the names of the shops that do not sell the cats named "Murzik" and "Zuza"
SELECT shops.shopname as shop_name
FROM shops  -- From the table of shops
WHERE shops.id NOT IN (  -- Where the shop id is not in the following subquery
    SELECT shops.id
    FROM cats  -- From the table of cats
    JOIN shops ON shops.id = cats.shops_id  -- Join it with the table of shops based on the shop id
    WHERE cats.name IN ("Murzik", "Zuza")  -- Where the name of the cat is either "Murzik" or "Zuza"
);
