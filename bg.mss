Map {
  background-color: @land;
}

// Water
#water {
  polygon-fill: @water;
  polygon-gamma: 0.7;
  ::shadow {
    polygon-fill: @water;
    opacity: 0.7;
    comp-op: screen;
    image-filters: agg-stack-blur(10, 10);
  }
  [zoom>12] { polygon-gamma: 0.75; }
}

#waterway {
  [type='river'][zoom>=12], [type='canal'][zoom>=12] {
    line-color: @water;
    line-width: 1;
    line-cap: round;
    [zoom>=14] { line-width: 2; }
    [zoom>=16] { line-width: 3; }
    [zoom>=17] { line-width: 4; }
    [zoom>=18] { line-width: 5; }
    [zoom>=19] { line-width: 6; }
  }
  [type='stream'][zoom>=14], [type='stream_intermittent'][zoom>=14] {
    line-color: @water;
    line-width: 1;
    line-cap: round;
    [zoom>=15] { line-width: 1.5; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
  [type='ditch'][zoom>=15], [type='drain'][zoom>=15] {
    line-color: @water;
    line-width: 0.5;
    line-cap: round;
    [zoom>=15] { line-width: 1; }
    [zoom>=16] { line-width: 2; }
    [zoom>=18] { line-width: 3; }
  }
}

// Political
#admin[maritime=0] {
  line-color: @admin_2;

  // States
  ::lev3outline[admin_level>=3] {
    line-color: lighten(@land, 10);
    line-join: round;
    line-width: 0.6 + 1;
    [zoom>=6] { line-width: 1 + 1; }
    [zoom>=7] { line-width: 1.5 + 1; }
    [zoom>=12] { line-width: 2 + 1; }
  }
  ::lev3[admin_level>=3] {
    line-color: @admin_3;
    line-join: round;
    line-width: 0.6;
    [zoom>=6] { line-width: 1; }
    [zoom>=7] { line-width: 1.5; }
    [zoom>=12] { line-width: 2; }
  }

  // Countries
  ::lev2outline[admin_level=2][zoom>=2] {
    line-width: 1 + 1;
    line-color: lighten(@land, 20);
    line-join: round;
    [zoom>=5] { line-width: 2 + 1; }
    [zoom>=6] { line-width: 2.5 + 1; }
    [zoom>=8] { line-width: 3 + 2; }
    [disputed=1] { line-dasharray: 4, 4; }
  }
  ::lev2[admin_level=2] {
    line-width: 1;
    line-color: @admin_2;
    line-join: round;
    [zoom>=5] { line-width: 2; }
    [zoom>=6] { line-width: 2.5; }
    [zoom>=8] { line-width: 3; }
    [disputed=1] { line-dasharray: 4, 4; }
  }
}

// Land cover
#landcover {
  ::0[zoom<=12], ::1[zoom>=13][zoom<=14], ::2[zoom=15],
  ::3[zoom=16], ::4[zoom=17], ::5[zoom>=18] {
    [class="wood"] { polygon-fill: @wooded; }
    [class="scrub"] { polygon-fill: @scrub; }
    [class="grass"] { polygon-fill: @grass; }
    [class="crop"] { polygon-fill: @crop; }
    [class="snow"] { polygon-fill: @snow; }
  }
  ::1[zoom>=13][zoom<=14] { image-filters: agg-stack-blur(1, 1); }
  ::2[zoom=15] { image-filters: agg-stack-blur(4, 4); }
  ::3[zoom=16] { image-filters: agg-stack-blur(8, 8); }
  ::4[zoom=17] { image-filters: agg-stack-blur(16, 16); }
  ::5[zoom>=18] { image-filters: agg-stack-blur(32, 32); }
}

// Landuse - woods/scrub
#landuse {
  ::greenery {
    [class='wood'] { polygon-fill: @wooded; }
    [class='scrub'] { polygon-fill: @scrub; }
    [class='grass'] { polygon-fill: @grass }
    [class='wood'], [class='scrub'], [class='grass'] {
      polygon-opacity: 0.7;
      [zoom=7] { polygon-opacity: 0.2; }
      [zoom=8] { polygon-opacity: 0.5; }
    }
  }
}

// Landuse - parks
#landuse {
  [class='park'] {
    polygon-fill: @park;
    [zoom=7] { polygon-opacity: 0.2; }
    [zoom=8] { polygon-opacity: 0.5; }
    [zoom=9] { polygon-opacity: 0.9; }
  }
}

// Landuse - pitches
#landuse {
  [class='pitch'][zoom<=17] {
    polygon-fill: @park;
    line-color: lighten(@park, 10);
    line-width: 1;
    [zoom=17] { line-width: 1.5; }
  }
  [class='pitch'][zoom>=18] {
    ::wall {
      line-color: lighten(@park, 10);
      line-width: 3;
      line-join: round;
      line-cap: round;
      polygon-fill: lighten(@park, 10);
    }
    ::roof {
      polygon-fill: @park;
      polygon-geometry-transform: translate(-2, -2);
      polygon-clip: false;
      [zoom>=15] {
        line-width: 1;
        line-color: lighten(@park, 10);
        line-geometry-transform: translate(-2, -2);
        line-clip: false;
      }
    }
  }
}

// Landuse - other
#landuse {
  [class='sand'] {
    polygon-fill: @sand;
  }
  [class='school'] {
    polygon-fill: @school;
    line-width: 0.5;
    line-color: darken(@school, 2);
  }
  [class='cemetery'] {
    polygon-fill: @cemetery;
  }
  [class='hospital'] {
    polygon-fill: @hospital;
    line-color: @gray-3;
  }
  [class='parking'] {
    polygon-fill: @parking;
    [zoom>=16] {
      line-color: darken(@parking, 10);
      line-dasharray: 5, 2;
      line-width: 0.5;
    }
  }
  [class='industrial'] {
    polygon-fill: @industrial;
  }
  [class='piste'] {
    polygon-fill: @piste;
  }
  [class='glacier'] {
    polygon-fill: @glacier;
  }
}

// Landuse overlay
#landuse_overlay[zoom>=12] {
  [class='breakwater'][zoom>=13], [class='pier'][zoom>=13] {
    polygon-fill: @land;
  }
  [class='wetland'] {
    polygon-pattern-file: url(img/pattern/wetland-16.png);
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wetland-64.png);
    }
    [zoom>=17] {
      polygon-pattern-file: url(img/pattern/wetland-256.png);
    }
  }
  [class='wetland_noveg'] {
    polygon-pattern-file: url(img/pattern/wetland_noveg-16.png);
    [zoom>=14] {
      polygon-pattern-file: url(img/pattern/wetland_noveg-64.png);
    }
    [zoom>=17] {
      polygon-pattern-file: url(img/pattern/wetland_noveg-256.png);
    }
  }
}

// Airport
#aeroway['mapnik::geometry_type'=2][zoom>=12] {
  line-color: lighten(@aeroway, 8);
  [zoom>=15] { line-width: 2; }
  [zoom>=17] { line-width: 3; }
}
#aeroway['mapnik::geometry_type'=3][zoom>9] {
  polygon-fill: @aeroway;
  [type='apron'] {
    polygon-fill: @parking;
  }
}

// Buildings
#building[zoom>=16][zoom<=17] {
  polygon-fill: @building;
  line-color: @building_line;
  line-width: 0.5;
  [zoom=16] { polygon-opacity: 0.5; }
  [zoom=17] {
    polygon-opacity: 0.75;
    line-width: 1;
  }
}
#building[zoom>=18] {
  ::wall {
    line-color: @building_line;
    line-width: 2;
    line-join: round;
    line-cap: round;
    polygon-fill: @building_line;
  }
  ::roof {
    polygon-fill: @building;
    polygon-geometry-transform: translate(-0.5, -0.5);
    polygon-clip: false;
    [zoom>=15] {
      line-width: 1;
      line-color: @building_line;
      line-geometry-transform: translate(-0.5, -0.5);
      line-clip: false;
    }
    [zoom>=19] {
      polygon-geometry-transform: translate(-1, -1);
      line-width: 1.5;
      line-geometry-transform: translate(-1, -1);
    }
  }
}

// Barriers - hedges
#barrier_line[class='hedge'][zoom>=16][zoom<=17] {
  line-color: darken(@park, 10);
  line-width: 1;
  line-join: round;
  line-cap: round;
}
#barrier_line [class='hedge'][zoom>=18] {
  ::shadow {
    line-color: darken(@park, 7);
    line-width: 2;
    line-join: round;
    line-cap: round;
    [zoom>=20] { line-width: 3; }
  }
  ::main {
    line-color: darken(@park, 2);
    line-width: 2;
    line-join: round;
    line-cap: round;
    line-geometry-transform: translate(-1, -1);
    [zoom>=19] {
      line-geometry-transform: translate(-2, -2);
    }
    [zoom>=20] { line-width: 3; }
  }
}

// Barrier - fences
#barrier_line[class='fence'][zoom>=16] {
  line-color: @fence;
  line-width: 0.5;
  line-join: round;
  line-cap: round;
  [zoom>=17] { line-width: 1; }
}
#barrier_line[class='fence'][zoom>=18] {
  ::shadow {
    line-color: @fence;
    line-width: 1;
    line-join: round;
    line-cap: round;
  }
  ::main {
    line-color: @fence;
    line-width: 1;
    line-join: round;
    line-cap: round;
    line-geometry-transform: translate(-1, -1);
  }
}

// Barrier - gate
#barrier_line[class='gate'][zoom>=17] {
  line-color: @gate;
  line-width: 1;
  line-join: round;
  line-cap: round;
  [zoom>=18] { line-width: 2; }
}

// Barrier - land
#barrier_line[zoom>=14][class='land'] {
  ['mapnik::geometry_type'=2] {
    line-color: @land;
    line-cap: round;
    [zoom=14] { line-width: 0.75; }
    [zoom=15] { line-width: 1.5; }
    [zoom=16] { line-width: 2; }
    [zoom=17] { line-width: 3; }
    [zoom=18] { line-width: 6; }
    [zoom=19] { line-width: 12; }
    [zoom>19] { line-width: 24; }
  }
  ['mapnik::geometry_type'=3] {
    polygon-fill: @land;
  }
}

// Barrier - cliff
#barrier_line[zoom>=12][class='cliff'] {
  line-pattern-file: url(img/pattern/cliff-md.png);
  [zoom>=16] {
    line-pattern-file: url(img/pattern/cliff-lg.png);
  }
}