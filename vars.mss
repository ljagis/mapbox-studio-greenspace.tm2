@name: '[name]';
// Mapbox streets label language. `name` = local

// Fonts
@med: "Meta Offc Pro Medium";
@reg: "Meta Offc Pro Normal";
@bold: "Meta Offc Pro Bold";
@it: "Meta Offc Pro Normal Italic";

// Base colors
@black: #222;
@gray-1:#f4f3eb;
@gray-2:#e0dbca;
@gray-3:#cbcac5;
@gray-4:#999992;
@gray-5:#666662;

@blue: #27acdb;
@blue_lt: lighten(@blue, 10);
@yellow: #fcf302;
@red: #e44a4a;
@blue-gray: desaturate(@blue, 40);
@green: #05e24e;
@green-desat: desaturate(lighten(@green, 20), 70);

// Landuse
@water: desaturate(@blue, 45);
@land: @gray-2;
@park: mix(@green-desat, @land, 70);
@sand: mix(@yellow, @land, 10);
@snow: lighten(desaturate(@blue, 65), 40);

// Secondary landuse
@cemetery: mix(@park, @building, 30);
@wooded: mix(@land, @park, 40);
@pitch: @park;
@sports: @park;
@hospital: darken(@land, 4);
@school: darken(@land, 4);
@industrial: darken(@land, 4);
@aeroway: darken(@land, 4);
@glacier: darken(@snow, 10);
@parking: mix(@land, lighten(@gray-4, 25), 40);
@building: desaturate(darken(@land, 2), 5);
@building_line: desaturate(darken(@land, 8), 10);
@fence: @building_line;
@gate: @gray-4;

// Land cover
@scrub: mix(@wooded, @land, 50);
@grass: mix(@wooded, @land, 40);
@crop: mix(@wooded, @land, 30);
@snow: @snow;

// Roads
@rail: fadeout(darken(@gray-3, 25), 80);
@motorway_fill: lighten(@land, 12);
@motorway_case: darken(@gray-3, 8);
@piste: @glacier;

// Labels
@place_halo: fadeout(@land, 90);

@country_text: @black;
@country_text_high: @gray-4;
@country_halo: fadeout(#fff, 90);
@state_text: @gray-4;
@state_halo: fadeout(#fff, 90);
@city_text: @black;
@city_text_high: @gray-4;
@city_halo: fadeout(#fff, 90);
@town_text: @black;
@town_text_high: @city_text_high;
@town_halo: fadeout(#fff, 90);
@village_text: @black;
@village_text_high: @city_text_high;
@village_halo: fadeout(#fff, 90);
@neigh_text: @black;
@neigh_text_high: @city_text_high;
@neigh_halo: fadeout(#fff, 90);

@marine_text: lighten(desaturate(@blue, 45), 10);
@poi_text: darken(@gray-4, 20);
@poi_halo: fadeout(#fff, 90);
@peak_text: @gray-5;
@peak_halo: park_halo;
@park_text: darken(@park, 45);
@park_halo: fadeout(#fff, 90);
@transport_text: darken(@gray-4, 10);
@transport_halo: fadeout(lighten(@industrial, 30), 90);
@road_text: darken(@gray-4, 3);
@road_text_high: @gray-5;
@road_text_high2:@black;
@road_halo: fadeout(#fff, 70);
@motorway_halo: @motorway_fill;

// Admin
@admin_2:darken(desaturate(@land, 20), 25);
@admin_3:darken(desaturate(@land, 20), 25);