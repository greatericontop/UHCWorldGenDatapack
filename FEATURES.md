# Feature explanations

## Removing oceans

We increase the continentalness value in `continents.json`.
Here, we set the minimum to 0.25. This makes it so that oceans (which require negative continentalness) don't generate.

You'll find that if you only do this, you'll sometimes get big and deep lakes that resemble mini-oceans.
To reduce this further, we go to the PV value in `ridges_folded.json` and prevent it from decreasing beyond `-0.85`.
This reduces the depth of the fake oceans and also sometimes generates land over them.

## Increasing small cave frequency

These can be adjusted in the `configured_carver` section.
There are 3 of them - `canyon.json` for canyons/ravines, and `cave.json` and `cave_extra_underground.json` for caves.
You can then adjust the probability setting.

In this pack, I increased the cave (not canyon) frequencies by 50%, with the goal of having more small caves so it's more likely everyone can find at least some cave.

## Reducing extreme hills

This is done by scaling the weirdness value in `ridges.json`. Here, we multiplied it by 0.35.

## Changing world bottom

This step is a bit involved. We need to do all of the following:

- In `caves.json` and `overworld.json` under `noise_settings`, find the `y_clamped_gradient` and change it from `-64` or `-72` to your world height. This prevents noise caves from overwriting bedrock.
- In `overworld.json` under `dimension_type`, change `min_y` and `height` appropriately.
- In `spaghetti_2d.json` under `density_function/overworld/caves`, change the `y_clamped_gradient` from `-64` or `-72` to your world height.
- In `noodle.json` under `density_function/overworld/caves`, change all the minimum y fields in the `range_choice` sections to your world height, or slightly above (I used `-30.0`, I'm not sure if you have to do slightly above or if setting it to exactly the height also works).

## Ore rebalancing

It's extremely easy to get ores from caves in vanilla, but I didn't want the game to be completely dependent on finding a good cave.
I have found these settings to have a reasonable balance between cave and strip mining.
Also, I tweaked the values so the amount of ores you get on average feels balanced for a game (not everyone is full diamond, stuff like that).

The settings are located in both `worldgen/configured_feature` and `worldgen/placed_feature` (they reference each other).

**Diamonds**

- Diamond buried
  - `configured_feature/ore_diamond_buried.json`, `placed_feature/ore_diamond_buried.json`
  - Reduced air exposure: 100% (unchanged)
  - Size: 8 (unchanged)
  - Count: 4 (unchanged)
  - Height range
    - Old: trapezopid from -80 to +80 above bottom, the trapezoid distribution basically is a triangle with lowest at the ends and highest in the middle, but in this case the middle is the bottom of the world, so it's just the top half of the triangle where there are more diamonds the deeper you go
    - New: trapezoid from -48 to +48 above bottom for -32 world height
- Diamond small
  - `configured_feature/ore_diamond_small.json`, `placed_feature/ore_diamond.json` (don't ask why it's different)
  - Reduced air exposure: 60% (increased from 50%)
  - Size: 4 (unchanged)
  - Count: 7 (unchanged)
  - Height range: changed trapezoid, see above
- Diamond medium
  - `configured_feature/ore_diamond_medium.json`, `placed_feature/ore_diamond_medium.json`
  - Reduced air exposure: 60% (increased from 50%)
  - Size: 8 (unchanged)
  - Count: 4 (increased from 2)
  - Height range: uniform from -32 to -4 (instead of uniform from -64 to -4)
- Diamond large
  - `configured_feature/ore_diamond_large.json`, `placed_feature/ore_diamond_large.json`
  - Reduced air exposure: 70% (unchanged)
  - Size: 12 (unchanged)
  - Count: 1 per 9 chunks (unchanged)
  - Height range: changed trapezoid, see above

**Gold**

- Gold buried
  - `configured_feature/ore_gold_buried.json`, `placed_feature/ore_gold.json`
  - Reduced air exposure: 60% (increased from 50%)
  - Size: 9 (unchanged)
  - Count: 4 (unchanged)
  - Height range: trapezoid -32 to 32 (instead of trapezoid -64 to 32)
- Gold lower
  - `configured_feature/ore_gold_buried.json` (same file), `placed_feature/ore_gold_lower.json`
  - I have this one disabled (by virtue of it spawning below the world height), but you can edit the config if you'd like.
- Badlands gold is in `configured_feature/ore_gold.json`, `placed_feature/ore_gold_extra.json`

**Iron**

- Iron normal
  - `configured_feature/ore_iron.json`, `placed_feature/ore_iron_middle.json`
  - Reduced air exposure: 50% (increased from 0%)
  - Size: 10 (increased from 9)
  - Count: 20 (increased from 10)
  - Height range: trapezoid from -24 to 56 (unchanged)
- Iron small
  - `configured_feature/ore_iron_small.json`, `placed_feature/ore_iron_small.json`
  - Reduced air exposure: 50% (increased from 0%)
  - Size: 4 (unchanged)
  - Count: 20 (increased from 10)
  - Height range: uniform from 0 to 72 (unchanged)

**Lapis**

- Lapis normal
  - `configured_feature/ore_lapis.json`, `placed_feature/ore_lapis.json`
  - Reduced air exposure: 30% (increased from 0%)
  - Size: 7 (unchanged)
  - Count: 4 (increased from 2)
  - Height range: trapezoid from -32 to 32 (unchanged)
- There's also a lapis buried but I didn't change anything there


## Reducing size of cheese caves

I wanted to reduce the size of the cheese (huge) caves to make them less powerful, but it's annoying.

The relevant settings are in `sloped_cheese.json` (https://mcasset.cloud/1.21.4/data/minecraft/worldgen/density_function/overworld/sloped_cheese.json - really good website to see the defaults by the way).

However, messing with them like changing the multipliers or adding offsets doesn't seem to do anything to the caves.
If someone figures it out, please let me know!
