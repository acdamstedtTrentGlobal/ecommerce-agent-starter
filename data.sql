USE ecommerce;

-- Categories
INSERT INTO categories (name) VALUES
('Vitamins & Minerals'),
('Sports Nutrition'),
('Heart Health'),
('Bone & Immune'),
('Digestive Health'),
('Sleep Support');

-- Products (with category_id)
INSERT INTO products (category_id, name, brand, price, imageUrl, description, stock) VALUES
(1, 'Nature Made Multi for Him', 'Nature Made', 29.99, 'https://www.naturemade.com/cdn/shop/files/NM1789PK001929MULTIFORHIM_5A007225ccfront_1500x.png?v=1756999774', 'Daily multivitamin with 25+ vitamins and minerals for overall health and wellness', 150),
(2, 'Gold Standard 100% Whey Protein', 'Optimum Nutrition', 49.99, 'https://www.optimumnutrition.com/cdn/shop/files/US_GSW_5LB_FrenchVanCr_FOP.png?v=1781190678&width=1400', 'High-quality protein powder for muscle building and post-workout recovery', 100),
(3, 'Nature Made Fish Oil 1200mg', 'Nature Made', 24.99, 'https://www.naturemade.com/cdn/shop/files/NM1328PK000745FISHOIL_5A009400ccfront_1500x.png?v=1695678265', 'Heart-healthy omega-3 fatty acids EPA and DHA for cardiovascular support', 200),
(4, 'Sports Research Vitamin D3 K2', 'Sports Research', 19.99, 'https://www.sportsresearch.com/_next/image?url=https%3A%2F%2Fcdn.shopify.com%2Fs%2Ffiles%2F1%2F1813%2F6377%2Ffiles%2Fsr_web_render_fg218_d3_k2_front_medium_8bf76316-42d5-493f-ab5e-5aadfb7cc797.png%3Fv%3D1778270249&w=1920&q=75', 'Essential vitamins for bone health and immune system support', 180),
(5, 'Culturelle Daily Probiotic', 'Culturelle', 34.99, 'https://culturelle.com/cdn/shop/files/cul-DDH-50-display.webp?crop=center&height=1200&v=1778762170&width=1200', '50 billion CFU probiotic blend for digestive health and immunity', 120),
(6, 'Natrol Melatonin 5mg', 'Natrol', 14.99, 'https://www.natrol.com/cdn/shop/files/4837.931_Melatonin_5mg_TR_100ct_150ccLabel_Front_DS.png?v=1745966369&width=700', 'Natural sleep aid to help regulate sleep cycle and improve rest quality', 250);

-- Tags
INSERT INTO tags (name) VALUES
('adult'),
('multivitamin'),
('athlete'),
('protein'),
('cardio'),
('omega-3'),
('immune'),
('bone'),
('probiotic'),
('gut'),
('sleep'),
('melatonin');

-- Product-Tag associations
INSERT INTO product_tags (product_id, tag_id) VALUES
(1, 1), (1, 2),        -- Multivitamin: adult, multivitamin
(2, 3), (2, 4),        -- Whey: athlete, protein
(3, 5), (3, 6),        -- Fish Oil: cardio, omega-3
(4, 7), (4, 8),        -- D3+K2: immune, bone
(5, 9), (5, 10), (5, 7), -- Probiotic: probiotic, gut, immune
(6, 11), (6, 12);      -- Melatonin: sleep, melatonin

INSERT INTO users (name, email, password, salutation, country, role) VALUES
('Admin User', 'admin@example.com', '$2b$10$wfKRyY4X//rui5Zye9wRGeJPaQg2WUu/FMSzvudlEXx9Rd.rsJv66', 'Mr', 'USA', 'admin'),  -- password: admin123
('John Doe', 'john@example.com', '$2b$10$RyoQaDS.vDwi7IPiW6TitO9m3qZft/hlvfAhdnk/IStkSmYzwGJlO', 'Mr', 'USA', 'user'),      -- password: user123
('Jane Smith', 'jane@example.com', '$2b$10$RyoQaDS.vDwi7IPiW6TitO9m3qZft/hlvfAhdnk/IStkSmYzwGJlO', 'Ms', 'UK', 'user'),     -- password: user123
('Bob Johnson', 'bob@example.com', '$2b$10$RyoQaDS.vDwi7IPiW6TitO9m3qZft/hlvfAhdnk/IStkSmYzwGJlO', 'Mr', 'Canada', 'user'); -- password: user123

INSERT INTO marketing_preferences (id, preference) VALUES
(1, 'Email Marketing'),
(2, 'SMS Marketing');

INSERT INTO user_marketing_preferences (user_id, preference_id) VALUES
(1, 1),
(1, 2),
(2, 1),
(3, 2);

INSERT INTO cart_items (user_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 5, 1);

INSERT INTO orders (user_id, total, status, checkout_session_id) VALUES
(1, 109.97, 'completed', 'cs_test_1234567890'),
(2, 74.97, 'shipping', 'cs_test_0987654321'),
(3, 34.99, 'pending', 'cs_test_1122334455');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2),
(1, 2, 1),
(2, 3, 3),
(3, 5, 1);

-- Sample reviews
SET @empty_embedding = VEC_FromText(CONCAT('[', REPEAT('0,', 3071), '0]'));

INSERT INTO reviews (product_id, title, review_text, review_date, rating, embedding) VALUES
(1, 'Great daily multivitamin', 'I have been taking Nature Made Multi for Him for about six months now and I genuinely notice a difference in my energy levels throughout the day. The tablet is easy to swallow and does not cause any stomach upset when taken with breakfast. I appreciate that it does not contain iron since most men do not need extra iron supplementation. The USP verification gives me confidence that what is on the label is actually in the pill. Would definitely recommend to any man looking for a solid all-in-one daily vitamin.', '2026-01-15', 5, @empty_embedding),
(1, 'Decent multivitamin but nothing special', 'This is a reliable multivitamin that covers all the basics. I take it every morning with my coffee and have not had any issues with it. The vitamin D content is higher than most which is a plus since many people are deficient. My only complaint is that the tablet is a bit large compared to other brands I have tried. The price is reasonable for what you get and the Nature Made brand has a good reputation for quality. Three stars because I have not noticed any dramatic changes but it seems to be doing its job quietly.', '2026-02-20', 3, @empty_embedding),
(1, 'My go-to multivitamin', 'Switched to this from a more expensive brand and honestly cannot tell the difference in how I feel. The B vitamin complex in this formula really does seem to help with afternoon energy slumps. I like that it is gluten free and does not have artificial colors. Been using Nature Made products for years and they have never let me down. Will keep buying.', '2026-03-10', 4, @empty_embedding),
(2, 'Best tasting protein powder I have tried', 'The French Vanilla Creme flavor of Gold Standard Whey is genuinely delicious. It mixes incredibly well with just a shaker bottle and water with no clumps whatsoever. Each serving gives you 24 grams of protein which is exactly what I need post workout. I have tried many protein powders over the years and this one consistently delivers on taste and mixability. The macros are clean with low fat and carbs which suits my cutting phase perfectly. Highly recommend to anyone serious about their training.', '2026-01-05', 5, @empty_embedding),
(2, 'Good protein but expensive', 'The quality of Gold Standard Whey is undeniable. The amino acid profile is excellent with plenty of leucine to trigger muscle protein synthesis. I use it after every lifting session and my recovery has noticeably improved since switching to this from a cheaper brand. My only issue is the price point which has gone up significantly. For the quality you are getting it is worth it but it does sting the wallet. The 5 pound bag lasts me about six weeks training five days a week.', '2026-02-14', 4, @empty_embedding),
(2, 'Solid product but caused some digestive issues', 'Great protein in terms of quality and taste however I did experience some bloating when I first started using it. This seems to have settled down after a few weeks which I have heard is common when introducing whey protein. The Aminogen enzyme blend they include does seem to help with digestion compared to other whey products I have used. Mixes well and tastes good. Would give five stars if not for the initial digestive adjustment period.', '2026-03-22', 3, @empty_embedding),
(3, 'No fishy burps and great value', 'I was hesitant to try fish oil because of the infamous fishy burp problem but these softgels have been completely fine for me. I take mine with dinner and have had zero issues. My doctor recommended omega-3 supplements for my triglyceride levels and after three months my numbers have improved noticeably. The softgels are a good size and easy to swallow. Nature Made is a trusted brand and the USP verification means I know I am getting what the label says.', '2026-01-28', 5, @empty_embedding),
(3, 'Good omega-3 supplement', 'Been taking these for about four months as part of a heart health regimen recommended by my cardiologist. The EPA and DHA content per serving is good value compared to other brands. I store mine in the refrigerator as recommended which seems to keep them fresh. The only minor issue is that the softgels can stick together in warm weather but this is common with fish oil products. Overall a solid choice for omega-3 supplementation.', '2026-02-08', 4, @empty_embedding),
(3, 'Helps with joint pain', 'I started taking fish oil specifically for joint inflammation in my knees and after about six weeks I noticed a real reduction in morning stiffness. The anti-inflammatory properties of EPA are well documented and I am a believer now. These are affordable, easy to find, and from a reputable brand. My only wish is that the DHA content was slightly higher but for the price this is excellent value.', '2026-04-01', 4, @empty_embedding),
(4, 'Finally a D3 supplement with K2 included', 'I have been looking for a high quality D3 and K2 combination for a long time and this one delivers. The MK-7 form of K2 has the longest half-life which means better sustained activity in the body. The coconut oil base is a smart addition since D3 is fat soluble and needs dietary fat for proper absorption. My vitamin D blood levels have risen significantly since starting this three months ago. The capsule is small and easy to take. Excellent product from Sports Research.', '2026-01-20', 5, @empty_embedding),
(4, 'Great combination but high D3 dose', 'The product quality is excellent and I appreciate the synergy between D3 and K2. However I want to flag that 5000 IU of D3 is a pharmacological dose not a nutritional one. If you are already taking other supplements with D3 or spend significant time outdoors you should get your blood levels tested before using this regularly. That said for people who are deficient this combination is very effective. The coconut oil base definitely improves absorption compared to dry capsules I have tried before.', '2026-03-05', 4, @empty_embedding),
(4, 'Noticed improvement in mood and energy', 'I was severely deficient in vitamin D according to my blood work and started this supplement on my doctors recommendation. Within about six weeks I noticed a significant improvement in my mood and energy levels which is consistent with what the research says about vitamin D deficiency. The K2 component is important for directing calcium properly and I like that Sports Research has included it. Will continue taking this long term with periodic blood monitoring.', '2026-04-15', 5, @empty_embedding),
(5, 'Transformed my digestive health', 'I have struggled with IBS for years and have tried countless probiotic supplements with mixed results. Culturelle has been a game changer. Within two weeks of starting I noticed significantly less bloating and my bowel movements became much more regular. The LGG strain is the most studied probiotic in the world and it shows. The delayed release capsule ensures the bacteria survive stomach acid which is critical for efficacy. I have now been taking this for four months and the improvement has been sustained.', '2026-01-12', 5, @empty_embedding),
(5, 'Good probiotic but takes time to work', 'I started Culturelle after a course of antibiotics wiped out my gut bacteria. It took about three weeks before I started noticing improvements in my digestion. The 50 billion CFU count is generous and the multiple strains cover different aspects of gut health. I appreciate that it is shelf stable and does not require refrigeration which makes travel easy. The prebiotic inulin is a nice addition to feed the probiotic bacteria. Would recommend to anyone recovering from antibiotic use.', '2026-02-25', 4, @empty_embedding),
(5, 'Helped with immunity not just digestion', 'I started taking Culturelle primarily for digestive health but an unexpected benefit has been fewer colds this winter. The connection between gut health and immune function is real and this product seems to support both. No side effects whatsoever and the vegetarian capsule suits my diet. The price is reasonable for the CFU count you are getting. I now recommend this to family members as my go-to probiotic recommendation.', '2026-03-18', 5, @empty_embedding),
(6, 'Finally sleeping through the night', 'I have been a chronic insomniac for years and have tried everything. Natrol Melatonin 5mg time release has genuinely helped me sleep through the night without waking up at 3am. The time release mechanism is the key difference compared to standard melatonin which I found wore off too quickly. I take it 30 minutes before bed and am usually asleep within 20 minutes. No grogginess in the morning which was a problem with prescription sleep aids I tried in the past.', '2026-01-08', 5, @empty_embedding),
(6, 'Works well for jet lag', 'I travel internationally for work and melatonin is essential for resetting my body clock. The 5mg time release formula helps me stay asleep through the night in a new time zone rather than just falling asleep quickly. I have tried other melatonin products but the Natrol time release formulation gives me the most natural feeling sleep. Non-habit forming which is important since I use it frequently. Great product for frequent travelers.', '2026-02-16', 4, @empty_embedding),
(6, 'Effective but 5mg might be too much for some', 'This product works very well for sleep but I want to note that the 5mg dose is quite high. Research suggests that much lower doses of 0.5 to 1mg are often equally effective for most people. I find that 5mg leaves me feeling slightly groggy the next morning if I do not get at least 8 hours of sleep. That said the time release mechanism is excellent and for people with significant insomnia this dose may be appropriate. Consider cutting the tablet in half if you are sensitive to melatonin.', '2026-03-30', 3, @empty_embedding);

-- Additional low-stock products
INSERT INTO products (category_id, name, brand, price, imageUrl, description, stock) VALUES
(2, 'DemoFuel Creatine Monohydrate', 'DemoFuel', 39.99, 'https://example.com/images/creatine.png', 'Creatine monohydrate powder for strength and exercise performance', 8);
SET @creatine_product_id = LAST_INSERT_ID();

INSERT INTO products (category_id, name, brand, price, imageUrl, description, stock) VALUES
(4, 'DemoHealth Zinc + Vitamin C', 'DemoHealth', 9.99, 'https://example.com/images/zinc-vitamin-c.png', 'Zinc and vitamin C supplement for immune system support', 3);
SET @zinc_product_id = LAST_INSERT_ID();

-- Gold Standard 100% Whey - Double Rich Chocolate (flavor variant of product 2)
-- Added here because later review data references reviews for this product;
-- the original inserts only covered the French Vanilla Creme flavor.
INSERT INTO products (category_id, name, brand, price, imageUrl, description, stock) VALUES
(2, 'Gold Standard 100% Whey Protein - Double Rich Chocolate', 'Optimum Nutrition', 49.99, 'https://www.optimumnutrition.com/cdn/shop/files/US_GSW_5LB_DblRichChoc_FOP.png?v=1781190678&width=1400', 'High-quality protein powder for muscle building and post-workout recovery, chocolate flavor', 100);
SET @choc_whey_product_id = LAST_INSERT_ID();

-- Mock sales orders
INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(2, 124.97, 'completed', 'cs_mock_20260105_001', '2026-01-05 10:30:00');
SET @jan_order_1 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@jan_order_1, 2, 2), (@jan_order_1, 3, 1);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(3, 79.96, 'completed', 'cs_mock_20260112_002', '2026-01-12 14:15:00');
SET @jan_order_2 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@jan_order_2, 4, 4);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(4, 84.97, 'completed', 'cs_mock_20260120_003', '2026-01-20 09:45:00');
SET @jan_order_3 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@jan_order_3, 5, 2), (@jan_order_3, 6, 1);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(2, 139.95, 'completed', 'cs_mock_20260203_004', '2026-02-03 16:20:00');
SET @feb_order_1 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@feb_order_1, @creatine_product_id, 3), (@feb_order_1, @zinc_product_id, 2);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(3, 149.95, 'shipping', 'cs_mock_20260210_005', '2026-02-10 11:00:00');
SET @feb_shipping_order = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@feb_shipping_order, 1, 5);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(4, 49.99, 'cancelled', 'cs_mock_20260214_006', '2026-02-14 18:30:00');
SET @feb_cancelled_order = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@feb_cancelled_order, 2, 1);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(1, 109.96, 'completed', 'cs_mock_20260220_007', '2026-02-20 13:10:00');
SET @feb_order_2 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@feb_order_2, 1, 1), (@feb_order_2, 4, 2), (@feb_order_2, @creatine_product_id, 1);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(3, 59.97, 'completed', 'cs_mock_20260305_008', '2026-03-05 15:40:00');
SET @mar_order_1 = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@mar_order_1, @zinc_product_id, 1), (@mar_order_1, 3, 2);

INSERT INTO orders (user_id, total, status, checkout_session_id, created_at) VALUES
(4, 39.99, 'pending', 'cs_mock_20260318_009', '2026-03-18 20:00:00');
SET @mar_pending_order = LAST_INSERT_ID();
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(@mar_pending_order, @creatine_product_id, 1);

-- ============================================================
-- Additional reviews: chocolate whey, creatine, zinc products
-- (product_ids remapped to @choc_whey_product_id / @creatine_product_id / @zinc_product_id
-- to match the actual insert order above)
-- ============================================================

INSERT INTO reviews (product_id, title, review_text, review_date, rating, embedding) VALUES
-- Gold Standard 100% Whey Double Rich Chocolate (Optimum Nutrition) - mostly positive
(@choc_whey_product_id, 'Best chocolate protein I have tried', 'Rich, chocolatey, and mixes smooth with just a shaker bottle. This has become my go-to post-workout shake.', '2026-01-04', 5, @empty_embedding),
(@choc_whey_product_id, 'Tastes like a milkshake', 'Hard to believe this is a protein powder and not dessert. Blends great with almond milk and ice.', '2026-01-12', 5, @empty_embedding),
(@choc_whey_product_id, 'Great macros for cutting', '24g protein with low sugar and fat, exactly what I need to hit my numbers during a cut.', '2026-01-20', 5, @empty_embedding),
(@choc_whey_product_id, 'No more chalky aftertaste', 'Switched from a cheaper brand and the difference in taste and mixability is night and day.', '2026-01-28', 4, @empty_embedding),
(@choc_whey_product_id, 'Recovery feels faster', 'Soreness after leg day has noticeably improved since I started taking this daily.', '2026-02-05', 5, @empty_embedding),
(@choc_whey_product_id, 'Reliable quality every tub', 'Been buying this for over a year and every tub tastes consistent and mixes well.', '2026-02-13', 5, @empty_embedding),
(@choc_whey_product_id, 'Kids even like the taste', 'My teenager steals scoops for his smoothies because he loves the chocolate flavor.', '2026-02-21', 4, @empty_embedding),
(@choc_whey_product_id, 'Good value for the quality', 'Price crept up but the amino profile and taste still make it worth it over cheaper alternatives.', '2026-03-01', 4, @empty_embedding),
(@choc_whey_product_id, 'Perfect with just water', 'Do not even need milk, tastes rich and satisfying blended with plain water and ice.', '2026-03-09', 5, @empty_embedding),
(@choc_whey_product_id, 'Helped me hit my protein goals', 'Adding a scoop to oatmeal or coffee has made hitting my daily protein target so much easier.', '2026-03-17', 5, @empty_embedding),
(@choc_whey_product_id, 'Smooth texture, no clumps', 'Shakes up smooth even in a plain bottle with no blender ball needed.', '2026-03-25', 4, @empty_embedding),
(@choc_whey_product_id, 'A bit sweet for my taste', 'Good flavor overall but a little too sweet for me, I usually cut it with extra water.', '2026-04-02', 3, @empty_embedding),
(@choc_whey_product_id, 'Recent batch tasted off', 'Most tubs are great but one batch had a strange aftertaste that was not like the usual flavor.', '2026-04-10', 2, @empty_embedding),
(@choc_whey_product_id, 'Caused some bloating', 'Love the taste but my stomach gets bloated if I use a full scoop on an empty stomach.', '2026-04-18', 2, @empty_embedding),
(@choc_whey_product_id, 'Great taste, wish it was cheaper', 'No complaints about quality, just wish the price had not gone up so much recently.', '2026-04-26', 4, @empty_embedding),

-- DemoFuel Creatine Monohydrate (DemoFuel) - middling, mixed reviews
(@creatine_product_id, 'Does what it says', 'Standard creatine monohydrate, nothing fancy but it gets the job done for strength gains.', '2026-01-06', 4, @empty_embedding),
(@creatine_product_id, 'Noticed a small strength bump', 'After the loading phase I noticed a modest increase in my lifting numbers, nothing dramatic.', '2026-01-14', 3, @empty_embedding),
(@creatine_product_id, 'Mixes okay, some grit', 'Dissolves mostly fine in water but there is always a bit of grit left at the bottom of the glass.', '2026-01-22', 3, @empty_embedding),
(@creatine_product_id, 'Caused some water retention', 'Feel a bit puffier since starting this, which I know is common with creatine but still annoying.', '2026-01-30', 3, @empty_embedding),
(@creatine_product_id, 'Unflavored is truly flavorless', 'Appreciate that it has no taste, makes it easy to add to any drink without ruining the flavor.', '2026-02-07', 4, @empty_embedding),
(@creatine_product_id, 'Stomach discomfort at first', 'Had some cramping the first week before my body adjusted to the daily dose.', '2026-02-15', 2, @empty_embedding),
(@creatine_product_id, 'Average product, average results', 'Works as expected but I did not notice anything that sets it apart from cheaper creatine brands.', '2026-02-23', 3, @empty_embedding),
(@creatine_product_id, 'Packaging is flimsy', 'The tub lid does not seal tightly and some powder spilled during shipping.', '2026-03-03', 2, @empty_embedding),
(@creatine_product_id, 'Decent for the price', 'Not the best creatine I have used but reasonably priced for a basic monohydrate supplement.', '2026-03-11', 3, @empty_embedding),
(@creatine_product_id, 'Some bloating during loading phase', 'The recommended loading dose gave me noticeable bloating for the first several days.', '2026-03-19', 2, @empty_embedding),
(@creatine_product_id, 'Works fine mixed into protein shake', 'I just toss a scoop into my protein shake and have not had any issues with taste or texture.', '2026-03-27', 4, @empty_embedding),
(@creatine_product_id, 'No noticeable difference', 'Used a full tub over two months and honestly could not tell it was doing much for my performance.', '2026-04-04', 2, @empty_embedding),
(@creatine_product_id, 'Scoop size is inconsistent', 'The included scoop does not always give a consistent measurement between servings.', '2026-04-12', 3, @empty_embedding),
(@creatine_product_id, 'Fine as a basic supplement', 'Does the job as a no-frills creatine, would not go out of my way to repurchase over other brands though.', '2026-04-20', 3, @empty_embedding),
(@creatine_product_id, 'Mild headaches when I started', 'Had some headaches the first few days which went away once I increased my water intake.', '2026-04-28', 2, @empty_embedding),

-- DemoHealth Zinc + Vitamin C (DemoHealth) - mostly negative
(@zinc_product_id, 'Upset my stomach every time', 'No matter when I take it, whether with food or not, I get stomach cramps within the hour.', '2026-01-05', 1, @empty_embedding),
(@zinc_product_id, 'Tablets are oddly large', 'Struggle to swallow these every single time, they are much bigger than other zinc supplements I have tried.', '2026-01-13', 2, @empty_embedding),
(@zinc_product_id, 'Metallic aftertaste', 'Leaves an unpleasant metallic taste in my mouth for a while after taking it.', '2026-01-21', 2, @empty_embedding),
(@zinc_product_id, 'Caused nausea', 'Felt nauseous almost every morning after taking this on an empty stomach.', '2026-01-29', 1, @empty_embedding),
(@zinc_product_id, 'No noticeable immune benefit', 'Took this through an entire cold and flu season and still got sick twice.', '2026-02-06', 2, @empty_embedding),
(@zinc_product_id, 'Bottle arrived damaged', 'Cap was cracked and several tablets had crumbled to powder inside the bottle.', '2026-02-14', 1, @empty_embedding),
(@zinc_product_id, 'Gave me heartburn', 'Consistently causes a burning sensation in my chest, even when taken with a full meal.', '2026-02-22', 2, @empty_embedding),
(@zinc_product_id, 'Way too high a dose', 'Dosage feels excessive compared to the recommended daily zinc intake and made me feel jittery.', '2026-03-02', 2, @empty_embedding),
(@zinc_product_id, 'Smell is off-putting', 'Tablets have a strong chemical smell when you open the bottle which is a bit concerning.', '2026-03-10', 1, @empty_embedding),
(@zinc_product_id, 'Did not help at all', 'Bought this hoping to boost my immune system before a trip and still ended up sick.', '2026-03-18', 2, @empty_embedding),
(@zinc_product_id, 'Caused a rash', 'Developed itchy red patches on my arms a few days after starting this supplement.', '2026-03-26', 1, @empty_embedding),
(@zinc_product_id, 'Overpriced for what it is', 'Way more expensive than similar zinc and vitamin C combos with no added benefit that I could tell.', '2026-04-03', 2, @empty_embedding),
(@zinc_product_id, 'Actually helped my energy', 'One of the few things that gave me a small energy boost, though the stomach upset was annoying.', '2026-04-11', 3, @empty_embedding),
(@zinc_product_id, 'Hard to swallow and no benefit', 'Combination of a large pill size and no noticeable effect makes this a pass for me.', '2026-04-19', 1, @empty_embedding),
(@zinc_product_id, 'Customer service ignored my complaint', 'Reached out about a defective batch and never got a response back.', '2026-04-27', 1, @empty_embedding);

-- ============================================================
-- Additional reviews: expanded coverage for original 6 products
-- ============================================================

INSERT INTO reviews (product_id, title, review_text, review_date, rating, embedding) VALUES
-- Nature Made Multi for Him (product 1) - 20 reviews, ~70% positive
(1, 'Morning energy stays high', 'Taking this with breakfast keeps me alert through long shifts and I rarely crash.', '2026-01-05', 5, @empty_embedding),
(1, 'Easy on my stomach', 'Unlike other multis this one never upsets my stomach, even before workouts.', '2026-01-15', 4, @empty_embedding),
(1, 'Travel ready support', 'Packed a week of tablets for a conference and felt energized despite late nights.', '2026-01-25', 4, @empty_embedding),
(1, 'Supports my workouts', 'Recovery between lifting sessions feels faster since adding this vitamin.', '2026-02-02', 5, @empty_embedding),
(1, 'Keeps lab numbers steady', 'Recent bloodwork looked great and my doctor told me to keep using it.', '2026-02-12', 4, @empty_embedding),
(1, 'Helps hair and nails', 'Noticed stronger nails and less shedding after two months.', '2026-02-22', 4, @empty_embedding),
(1, 'Boosted focus at work', 'Afternoon meetings are easier because I stay mentally sharp.', '2026-03-03', 5, @empty_embedding),
(1, 'Convenient once-a-day routine', 'One tablet with coffee and I am done for the day.', '2026-03-12', 4, @empty_embedding),
(1, 'Trusted brand quality', 'USP mark gives me confidence and the results back it up.', '2026-03-21', 5, @empty_embedding),
(1, 'Affordable compared to others', 'Great value for the ingredient mix and 90-count bottle lasts long.', '2026-04-01', 4, @empty_embedding),
(1, 'Improved overall mood', 'Felt less irritable once my vitamin D levels climbed.', '2026-04-10', 5, @empty_embedding),
(1, 'No more afternoon slump', 'Energy stays steadier so I skip the sugary snacks.', '2026-04-20', 4, @empty_embedding),
(1, 'Smoothie friendly', 'Crushes easily so I can blend it when I do not want to swallow pills.', '2026-05-01', 4, @empty_embedding),
(1, 'Less soreness after runs', 'B complex seems to help recovery from weekend long runs.', '2026-05-10', 5, @empty_embedding),
(1, 'Tablets are too big', 'Wish they were smaller because swallowing them is a chore.', '2026-05-18', 2, @empty_embedding),
(1, 'Caused mild acne', 'Skin flared up after a week of use which went away once I stopped.', '2026-05-26', 2, @empty_embedding),
(1, 'Upset my stomach', 'Even with food I felt queasy for hours, so I switched brands.', '2026-06-04', 2, @empty_embedding),
(1, 'Made me jittery', 'Felt wired and could not sit still, so this is not for me.', '2026-06-12', 2, @empty_embedding),
(1, 'No noticeable change', 'Finished a bottle and felt exactly the same.', '2026-06-20', 3, @empty_embedding),
(1, 'Chalky taste', 'Coating dissolves fast and leaves a chalky taste in my mouth.', '2026-06-28', 2, @empty_embedding),

-- Gold Standard 100% Whey Protein (product 2) - 20 reviews, 50/50 polarity
(2, 'Mixes instantly in water', 'Shaker bottle plus cold water and it is perfectly smooth.', '2026-01-03', 5, @empty_embedding),
(2, 'Clean ingredient list', 'Appreciate the transparent label and minimal fillers.', '2026-01-11', 4, @empty_embedding),
(2, 'Great recovery drink', 'Muscles feel less sore the day after heavy deadlifts.', '2026-01-19', 5, @empty_embedding),
(2, 'Versatile in recipes', 'Use it in overnight oats and it tastes like dessert.', '2026-01-27', 4, @empty_embedding),
(2, 'Keeps my macros on track', 'Easy way to add 24g protein without extra carbs.', '2026-02-04', 4, @empty_embedding),
(2, 'Chocolate flavor is fantastic', 'Tastes like cocoa milk when blended with almond milk.', '2026-02-12', 5, @empty_embedding),
(2, 'Supports lean gains', 'Added a scoop post workout and finally broke a plateau.', '2026-02-20', 4, @empty_embedding),
(2, 'Value tub lasts a month', 'Training five days a week and the big tub goes far.', '2026-02-28', 4, @empty_embedding),
(2, 'Low sugar treat', 'Satisfies sweet cravings without derailing my cut.', '2026-03-07', 5, @empty_embedding),
(2, 'Stacks well with creatine', 'Digestive comfort is great even when stacking supplements.', '2026-03-15', 4, @empty_embedding),
(2, 'Too sweet and artificial', 'Flavoring tastes like pure syrup and lingers.', '2026-03-23', 2, @empty_embedding),
(2, 'Bloating every time', 'My stomach hurts after each shake even with lactase pills.', '2026-03-31', 2, @empty_embedding),
(2, 'Recent batch is sandy', 'Texture changed and now leaves grit at the bottom.', '2026-04-08', 2, @empty_embedding),
(2, 'Price jumped overnight', 'Love the product but the new price feels excessive.', '2026-04-16', 3, @empty_embedding),
(2, 'Vanilla tastes chemical', 'Reminds me of plastic and I could not finish the serving.', '2026-04-24', 2, @empty_embedding),
(2, 'Clogs my shaker ball', 'No matter how long I shake, there are stubborn clumps.', '2026-05-02', 2, @empty_embedding),
(2, 'Caused breakouts', 'Noticed acne along my jawline whenever I used it.', '2026-05-10', 2, @empty_embedding),
(2, 'Hard on lactose-sensitive folks', 'Even half scoops gave me cramps.', '2026-05-18', 2, @empty_embedding),
(2, 'Lid cracked after a week', 'Container quality feels cheaper than before.', '2026-05-26', 2, @empty_embedding),
(2, 'Customer service slow to respond', 'Took three weeks to answer a simple question.', '2026-06-03', 2, @empty_embedding),

-- Nature Made Fish Oil 1200mg (product 3) - 20 reviews, ~30% positive
(3, 'Truly no fish burps', 'Even when I take them at lunch there is zero aftertaste.', '2026-01-06', 5, @empty_embedding),
(3, 'Lab numbers improved', 'Triglycerides dropped 20 points after two months.', '2026-01-14', 4, @empty_embedding),
(3, 'Easy to swallow capsules', 'Softgels are slick and go down without water.', '2026-01-22', 4, @empty_embedding),
(3, 'Great value twin pack', 'Stocked up during a sale and saved a bundle.', '2026-01-30', 4, @empty_embedding),
(3, 'Helped loosen stiff knees', 'Morning walks are more comfortable now.', '2026-02-07', 4, @empty_embedding),
(3, 'Doctor approved', 'Primary care physician encouraged me to stay on this brand.', '2026-02-15', 5, @empty_embedding),
(3, 'Capsules fused together', 'Hot weather melted them into a sticky block.', '2026-02-23', 2, @empty_embedding),
(3, 'Persistent fishy taste', 'Even freezing them did not stop the fish burps.', '2026-03-04', 2, @empty_embedding),
(3, 'Made me nauseous', 'Felt sick within minutes of taking each dose.', '2026-03-12', 2, @empty_embedding),
(3, 'Softgels leaked', 'Oil coated the inside of the bottle and smelled terrible.', '2026-03-20', 2, @empty_embedding),
(3, 'No change in blood tests', 'Cholesterol barely moved after three months.', '2026-03-28', 2, @empty_embedding),
(3, 'Difficult to swallow', 'Size is too large and gets stuck in my throat.', '2026-04-05', 2, @empty_embedding),
(3, 'Upset stomach daily', 'Caused cramps every night so I tossed the bottle.', '2026-04-13', 2, @empty_embedding),
(3, 'Smells rancid', 'Opened a new bottle to a strong fish smell and had to return it.', '2026-04-21', 1, @empty_embedding),
(3, 'Short dated batch', 'Expiration is only two months out which feels risky.', '2026-04-29', 2, @empty_embedding),
(3, 'Made my skin oily', 'Breakouts along my hairline started right after taking these.', '2026-05-07', 2, @empty_embedding),
(3, 'Coating sticks to tongue', 'Leaves a gelatin film and weird texture.', '2026-05-15', 2, @empty_embedding),
(3, 'Difficult to travel with', 'Heat made the capsules deform during a trip.', '2026-05-23', 2, @empty_embedding),
(3, 'Bottle leaks', 'Found oil pooling under the bottle after a week.', '2026-05-31', 1, @empty_embedding),
(3, 'Made me dizzy', 'Felt lightheaded every time I used it.', '2026-06-08', 1, @empty_embedding),
(3, 'Terrible gelatin taste', 'Capsule shell tastes like rubber and sticks to my teeth.', '2026-06-16', 2, @empty_embedding),

-- Sports Research Vitamin D3 K2 (product 4) - 20 reviews, roughly 50/50 but skewed by request
(4, 'Fast boost to vitamin D', 'Blood test confirmed my levels are finally optimal.', '2026-01-04', 5, @empty_embedding),
(4, 'Small capsules are convenient', 'Tiny gelcaps make daily dosing effortless.', '2026-01-12', 4, @empty_embedding),
(4, 'Pairs great with calcium', 'Taking this alongside calcium improved my bone scan.', '2026-01-20', 4, @empty_embedding),
(4, 'Feels like sunshine in a bottle', 'Noticeable mood lift during gloomy weeks.', '2026-01-28', 5, @empty_embedding),
(4, 'Trust the coconut oil base', 'Absorption seems better than dry tablets I tried.', '2026-02-05', 4, @empty_embedding),
(4, 'Easy to travel with', 'Kept me healthy on a long trip with little sun exposure.', '2026-02-13', 4, @empty_embedding),
(4, 'No aftertaste', 'Capsules go down smooth and leave no flavor behind.', '2026-02-21', 4, @empty_embedding),
(4, 'Improved focus', 'Felt mentally sharper within weeks of starting.', '2026-03-01', 4, @empty_embedding),
(4, 'Joint comfort returned', 'K2 seems to help my knees feel less crunchy.', '2026-03-09', 4, @empty_embedding),
(4, 'Winter mood lifter', 'Seasonal blues were much less intense this year.', '2026-03-17', 4, @empty_embedding),
(4, 'Capsules melted together', 'Received a bottle of soft clumps during shipping.', '2026-03-25', 2, @empty_embedding),
(4, 'Dosage felt too strong', 'Developed restlessness and insomnia until I stopped.', '2026-04-02', 2, @empty_embedding),
(4, 'Caused heartburn', 'Burning sensation every time, even with meals.', '2026-04-10', 2, @empty_embedding),
(4, 'Gel caps stick', 'Have to pry them apart which ruins several servings.', '2026-04-18', 1, @empty_embedding),
(4, 'Greasy aftertaste', 'Coconut oil flavor hangs around for hours.', '2026-04-26', 2, @empty_embedding),
(4, 'Made me jittery', 'Felt wired and anxious until the evening.', '2026-05-04', 1, @empty_embedding),
(4, 'Oil leaked in luggage', 'Cap does not seal well and ruined my toiletry bag.', '2026-05-12', 2, @empty_embedding),
(4, 'Raised calcium too high', 'Doctor told me to stop because my labs spiked.', '2026-05-20', 1, @empty_embedding),
(4, 'Developed hives', 'Experienced itchy patches after each dose.', '2026-05-28', 1, @empty_embedding),
(4, 'Customer support unhelpful', 'Never heard back about a defective bottle.', '2026-06-05', 2, @empty_embedding),
(4, 'Capsules smell rancid', 'Fresh bottle smelled off and I could not trust it.', '2026-06-13', 1, @empty_embedding),

-- Culturelle Daily Probiotic (product 5) - 20 reviews, mixed polarity
(5, 'Helped calm my skin', 'Cleared stubborn blemishes once my digestion improved.', '2026-01-07', 5, @empty_embedding),
(5, 'Great during travel', 'Kept my stomach happy through two weeks abroad.', '2026-01-16', 4, @empty_embedding),
(5, 'Bloating eased by week three', 'Patience paid off and I feel lighter now.', '2026-01-25', 4, @empty_embedding),
(5, 'Kids tolerate it too', 'Split capsules into yogurt for my teens and it helped them.', '2026-02-03', 5, @empty_embedding),
(5, 'Shelf stable convenience', 'Love that it does not require refrigeration.', '2026-02-11', 4, @empty_embedding),
(5, 'Immune support bump', 'Fewer colds this winter which I credit to this probiotic.', '2026-02-19', 5, @empty_embedding),
(5, 'Less sugar cravings', 'Balanced gut seems to make sweets less tempting.', '2026-02-27', 4, @empty_embedding),
(5, 'Worked after antibiotics', 'Rebuilt my gut after a strong antibiotic course.', '2026-03-06', 5, @empty_embedding),
(5, 'Pricey but worth it', 'Subscription discounts help and my digestion is steady.', '2026-03-14', 4, @empty_embedding),
(5, 'Morning routine lifesaver', 'One capsule with water keeps me regular.', '2026-03-22', 5, @empty_embedding),
(5, 'Too many capsules per day', 'Taking three is hard to remember and results fade when I miss doses.', '2026-03-30', 3, @empty_embedding),
(5, 'Initial gas and cramping', 'Took a full month before my stomach settled down.', '2026-04-07', 3, @empty_embedding),
(5, 'No change for me', 'Finished a box and digestion stayed the same.', '2026-04-15', 2, @empty_embedding),
(5, 'Caused more bloating', 'Felt puffier after each capsule so I stopped.', '2026-04-23', 2, @empty_embedding),
(5, 'Hard to swallow capsules', 'They are surprisingly large and get stuck.', '2026-05-01', 2, @empty_embedding),
(5, 'Made me drowsy', 'Odd side effect but I felt sleepy after taking it.', '2026-05-09', 2, @empty_embedding),
(5, 'Too expensive to maintain', 'Great results but monthly cost is steep.', '2026-05-17', 3, @empty_embedding),
(5, 'Packaging flimsy', 'Foil blister tears and exposes capsules to air.', '2026-05-25', 2, @empty_embedding),
(5, 'Strange taste when opened', 'Powder smells sour if the capsule cracks.', '2026-06-02', 2, @empty_embedding),
(5, 'Did not reduce IBS flares', 'Symptoms stayed the same after two bottles.', '2026-06-10', 2, @empty_embedding),

-- Natrol Melatonin 5mg (product 6) - 20 reviews, improvised balance
(6, 'Perfect gentle nudge to sleep', 'Half a tablet helps me doze off without heavy grogginess.', '2026-01-09', 4, @empty_embedding),
(6, 'Time release really works', 'I stay asleep all night instead of waking at 2 a.m.', '2026-01-18', 5, @empty_embedding),
(6, 'Jet lag reset tool', 'Used it flying to Europe and adjusted quickly.', '2026-01-27', 4, @empty_embedding),
(6, 'Great for shift work', 'Helps me flip from nights to days without prescription meds.', '2026-02-05', 4, @empty_embedding),
(6, 'No hangover feeling', 'Wake up clearheaded which is rare for sleep aids.', '2026-02-13', 5, @empty_embedding),
(6, 'Helps my teen fall asleep', 'Half dose for my teenager works wonders before exams.', '2026-02-21', 4, @empty_embedding),
(6, 'Pairs nicely with magnesium', 'Combination gives me the best rest.', '2026-03-01', 4, @empty_embedding),
(6, 'Relaxes busy mind', 'Calms racing thoughts so I can wind down.', '2026-03-09', 4, @empty_embedding),
(6, 'Tastes neutral', 'Coating keeps it from tasting bitter.', '2026-03-17', 4, @empty_embedding),
(6, 'Dependable on travel days', 'One tablet beats trying to sleep without any help.', '2026-03-25', 4, @empty_embedding),
(6, 'Left me groggy', 'Need at least nine hours or I feel sluggish.', '2026-04-02', 2, @empty_embedding),
(6, 'Bitter when coating chips', 'If it cracks, the taste is awful and sticks around.', '2026-04-10', 2, @empty_embedding),
(6, 'Vivid dreams every night', 'Dreams got too intense so I stopped taking it.', '2026-04-18', 2, @empty_embedding),
(6, 'Packaging cracks easily', 'Cap shattered after one drop which made storage messy.', '2026-04-26', 3, @empty_embedding),
(6, 'Not strong enough for me', 'Still tossed and turned even after two tablets.', '2026-05-04', 2, @empty_embedding),
(6, 'Gave me headaches', 'Woke up with pounding headaches whenever I used it.', '2026-05-12', 2, @empty_embedding),
(6, 'Felt dizzy in the morning', 'Balance felt off for the first hour after waking.', '2026-05-20', 2, @empty_embedding),
(6, 'Hard to split tablets', 'Scored line crumbles when I cut them in half.', '2026-05-28', 2, @empty_embedding),
(6, 'No effect at all', 'Still staring at the ceiling after an hour.', '2026-06-05', 1, @empty_embedding),
(6, 'Body adjusted too quickly', 'Worked for a week and then stopped doing anything.', '2026-06-13', 2, @empty_embedding);