package Ragtime::ComposerList;

use strict;
use parent 'Tekki::Db::SimpleList';

# in the real world, this information would be retrieved from the database
my @composers = (
  ['Felix Arndt',       1889, 1918, '"Nola" (1915)'],
  ['May Aufderheide',   1888, 1972, '"Dusty" (1908)'],
  ['Roy Bargy',         1894, 1974, '"Pianoflage" (1922)'],
  ['William Beebe',undef,undef,   '"Ragtime March" (1897)'],
  ['Harry Belding',     1873, 1932, '"Good Gravy Rag" (1913)'],
  ['Theron C. Bennett', 1879, 1937, '"The St. Louis Tickle" (1904)'],
  ['Charlotte Blake',   1885, 1979, '"That Poker Rag" (1909)'],
  ['Eubie Blake',       1887, 1983, '"Charleston Rag" (1917)'],
  ['Blind Boone',       1864, 1927, '"Southern Rag Medley No. 1"'],
  ['George Botsford',   1874, 1949, '"Black and White Rag"'],
  ['Euday L. Bowman',   1887, 1949, '"Twelfth Street Rag"'],
  ['Thomas E. Broady', 1877,undef, '"Whittling Remus"'],
  ['Brun Campbell',       1884, 1952, '"Barber Shop Rag"'],
  ['Louis Chauvin',       1881, 1908, '"Heliotrope Bouquet"'],
  ['George L. Cobb',      1886, 1942, '"Russian Rag"'],
  ['Zez Confrey',         1895, 1971, '"Kitten on the Keys"'],
  ['Les C. Copeland',     1887, 1942, '"French Pastry Rag"'],
  ['Cecil Duane Crabb',   1890, 1953, '"Fluffy Ruffles"'],
  ['Reverend Gary Davis', 1896, 1972, '"Italian Rag" and "Soldier\'s March"'],
  [
    'Claude Debussy',
    1862, 1918, '"Golliwogg\'s Cakewalk" and "General Lavine"'
  ],
  ['Jacob Henry Ellis',undef,undef, '"Hannah\'s Promenade" (1897)'],
  ['James Reese Europe',    1880, 1919, '"Castle House Rag"'],
  ['Ernst Fischer',         1900, 1975, '"Pretty Baby"'],
  ['Lucian Porter Gibson',  1890, 1959, '"Jinx Rag"'],
  ['George Hamilton Green', 1893, 1970, '"Ragtime Robin"'],
  ['Gene Greene',           1881, 1930, '"King of the Bungaloos"'],
  ['Harry P. Guy',          1870, 1950, '"Echoes from the Snowball Club"'],
  ['R. J. Hamilton',undef,undef, '"Ragtime Patrol" (1897)'],
  ['Robert Hampton', 1890, 1945, '"Agitation Rag"'],
  [
    'Ben Harney',
    1871,
    1938,
    '"You\'ve Been a Good Old Wagon but You Done Broke Down" (1895) and "Cake Walk In The Sky"'
  ],
  ['Scott Hayden', 1882, 1915, '"Pear Blossoms"'],
  [
    'Ernest Hogan', 1865, 1909,
    '"La Pas Ma La" and "All Coons Look Alike to Me"'
  ],
  ['Abe Holzmann',       1874, 1939, '"Smoky Mokes"'],
  ['Charles Hunter',     1876, 1906, '"Tickled to Death"'],
  ['Harry Jentes',       1887, 1958, '"Bantam Step" (1916)'],
  ['Charles L. Johnson', 1876, 1950, '"Dill Pickles" (1906)'],
  ['James P. Johnson',   1894, 1955, '"Carolina Shout" (1925)'],
  [
    'Scott Joplin', 1867, 1917,
    '"Maple Leaf Rag" (1899) and "The Entertainer" (1902)'
  ],
  ['Joe Jordan',     1882, 1971, '"Pekin Rag" (1904)'],
  ['Sadie Koninsky', 1879, 1952, '"Eli Green\'s Cake Walk" (1898)'],
  [
    'William Henry Krell',
    1868,
    1933,
    '"Mississippi Rag" (1897) and "Shake Yo\' Dusters", or "Piccaninny Rag" (1898)'
  ],
  ['Joseph F. Lamb', 1887, 1960, '"American Beauty Rag" (1913)'],
  ['Henry Lodge',    1884, 1933, '"Temptation Rag"'],
  [
    'Marie Louka pseudonym of Johann C. Schmid',
    1870, 1951, '"The Rajah" (1902), "Karmara" (1903)'
  ],
  ['Arthur Marshall',              1881, 1968, '"Kinklets"'],
  ['Artie Matthews',               1888, 1958, '"Pastime Rag No. 5"'],
  ['Blind Willie McTell',          1898, 1959, '"Southern Can Is Mine"'],
  ['Kerry Mills',                  1869, 1948, '"At a Georgia Camp Meeting"'],
  ['Jelly Roll Morton',            1890, 1941, '"Frog-I-More Rag"'],
  ['Julia Lee Niebergall',         1886, 1968, '"Horseshoe Rag"'],
  ['Theodore Havermeyer Northrup', 1866, 1919, '"Louisiana Rag" (1897)'],
  ['Charlie Patton',               1891, 1934, '"Shake It And Break It"'],
  ['Paul Pratt',                   1890, 1948, '"Colonial Glide"'],
  [
    'Arthur Pryor', 1870, 1942,
    '"A Coon Band Contest" (1899), "Razzazza Mazzazza" (1906)'
  ],
  ['Luckey Roberts',     1887, 1968, '"Junk Man Rag"'],
  ['J. Russel Robinson', 1892, 1963, '"Eccentric" and "Sapho Rag"'],
  ['Paul Sarebresole',   1875, 1911, '"Roustabout Rag" (1897)'],
  ['James Scott',        1885, 1938, '"Frog Legs Rag" (1906)'],
  ['Arthur S. Shaw',     1878, 1949, '"Rag-Ma-La" (1897)'],
  ['Adaline Sheppard',   1885, 1950, '"Pickles and Peppers" (1906)'],
  ['Russell Smith',      1890, 1969, '"That Demon Rag" (1911)'],
  ['Ted Snyder',         1881, 1965, '"Ramshackle Rag" (1911)'],
  [
    'John Philip Sousa',
    1854, 1932, '"With Pleasure" (1912), "Willow Blossoms" (1916)'
  ],
  ['Etilmon J. Stark',         1868, 1962, '"Billiken Rag" (1913)'],
  ['Charley Straight',         1891, 1940, '"Rufenreddy" (1921)'],
  ['Igor Stravinsky',          1882, 1971, '"Piano-Rag-Music" (1919)'],
  ['Wilber Sweatman',          1882, 1961, '"Down Home Rag" (1911)'],
  ['Charles Hubbard Thompson', 1891, 1964, '"The Lily" (1914)'],
  ['Harry Tierney',            1890, 1965, '"The Bumble Bee" (1909)'],
  ['Tom Turpin',               1873, 1922, '"Harlem Rag" (1897)'],
  ['Fats Waller',              1904, 1943, '"Valentine Stomp" (1929)'],
  ['Percy Wenrich',            1880, 1952, '"Peaches and Cream" (1905)'],
  ['Clarence C. Wiley',        1883, 1908, '"Car-Barlick Acid" (1901)'],
  ['Clarence Woods',           1888, 1956, '"Slippery Elm Rag" (1912)'],
  ['Calvin Lee Woolsey',       1883, 1946, '"Medic Rag" (1910)'],
);

sub load {
  my ($class) = @_;
  my $self = {};
  for my $composer (@composers) {
    push @{$self->{content}}, {name => $composer->[0], born => $composer->[1], died => $composer->[2], compositions => $composer->[3]}
  }

  bless $self, $class;
}

sub compositions {
  return $_[0]->_get_string('compositions');
}

sub born {
  return $_[0]->_get_string('born');
}

sub died {
  return $_[0]->_get_string('died');
}

sub name {
  return $_[0]->_get_string('name');
}

sub to_arrayref {
  return \@composers;
}

1;
