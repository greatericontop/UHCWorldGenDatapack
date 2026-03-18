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

## Reducing size of cheese caves

I wanted to reduce the size of the cheese (huge) caves to make them less powerful, but it's annoying.

The relevant settings are in `sloped_cheese.json` (https://mcasset.cloud/1.21.4/data/minecraft/worldgen/density_function/overworld/sloped_cheese.json - really good website to see the defaults by the way).

However, messing with them like changing the multipliers or adding offsets doesn't seem to do anything to the caves.
If someone figures it out, please let me know!
