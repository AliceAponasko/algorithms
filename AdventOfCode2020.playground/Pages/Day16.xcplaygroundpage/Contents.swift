import Foundation

let input =
"""
departure location: 30-828 or 839-971
departure station: 38-339 or 352-958
departure platform: 39-905 or 921-968
departure track: 36-570 or 586-972
departure date: 48-190 or 196-957
departure time: 29-483 or 491-963
arrival location: 28-779 or 803-959
arrival station: 27-221 or 238-966
arrival platform: 28-732 or 741-963
arrival track: 41-752 or 767-967
class: 27-437 or 452-972
duration: 38-93 or 107-958
price: 36-196 or 213-974
route: 48-858 or 880-956
row: 36-59 or 73-974
seat: 39-423 or 431-974
train: 38-499 or 518-958
type: 45-562 or 569-961
wagon: 28-161 or 171-959
zone: 44-75 or 83-964

your ticket:
139,113,127,181,53,149,131,239,137,241,89,151,109,73,157,59,107,83,173,179

nearby tickets:
475,649,830,432,685,476,743,278,558,283,496,337,83,313,153,139,405,522,648,894
888,593,683,820,389,319,405,559,465,948,359,270,811,842,555,704,542,485,255,472
371,457,149,561,468,267,459,849,482,925,281,368,222,809,700,822,612,393,90,108
179,422,138,361,55,597,825,158,395,768,403,158,807,417,282,269,708,780,549,148
731,113,414,421,904,93,133,456,59,616,640,478,521,352,804,238,132,891,568,306
572,806,150,654,768,534,635,621,891,900,56,468,552,673,372,376,463,92,493,390
461,394,305,569,371,825,684,824,187,591,262,363,935,935,730,752,885,104,434,826
834,663,318,632,668,940,670,400,633,354,399,744,630,521,684,821,640,74,748,74
335,637,199,594,687,940,904,530,262,664,642,895,398,642,648,187,372,335,592,480
531,624,844,686,943,541,853,377,731,948,416,267,668,699,182,630,94,339,137,267
468,278,300,267,292,924,386,338,556,671,813,640,448,535,283,607,627,857,363,335
287,810,492,289,313,905,180,296,535,78,363,118,554,148,743,858,881,359,221,812
696,219,221,241,180,778,672,479,320,570,538,707,360,751,273,401,943,226,283,310
147,650,794,291,849,57,182,361,300,452,89,87,804,559,748,744,591,417,107,292
264,247,243,109,541,161,724,15,265,301,528,161,773,746,810,182,378,303,847,721
769,688,172,425,946,90,244,522,173,539,282,744,357,182,691,270,498,559,727,719
741,413,520,902,157,481,937,53,549,828,407,117,681,903,691,565,327,661,824,402
465,141,385,366,520,985,634,526,149,51,539,931,220,725,613,933,161,556,403,377
215,687,634,550,411,388,612,350,245,303,768,307,54,675,770,741,465,617,827,137
632,719,143,854,948,721,609,154,726,186,668,755,246,723,388,355,256,751,727,775
132,418,920,290,691,623,457,925,704,704,676,396,880,88,87,717,329,415,328,182
393,546,388,996,771,322,420,357,312,118,465,400,840,560,636,284,493,312,171,218
649,467,674,897,453,382,633,279,947,378,51,241,565,657,148,352,93,121,923,609
636,13,627,520,778,948,854,942,537,570,948,779,404,221,684,303,687,402,593,629
674,254,773,657,596,609,684,183,948,926,712,541,245,693,518,561,8,527,249,305
888,932,272,295,769,107,894,481,675,708,268,396,541,808,453,77,132,531,89,712
325,921,216,172,183,714,519,374,113,62,924,332,300,482,307,895,421,719,886,745
459,695,712,707,411,943,403,249,904,264,643,148,141,590,470,721,425,51,702,598
358,369,352,617,558,188,494,708,122,903,752,320,744,827,980,628,147,606,109,123
813,477,823,865,651,849,321,180,813,844,372,827,653,845,532,932,220,519,704,779
309,243,851,819,687,768,852,726,247,746,133,57,183,179,888,762,519,660,328,542
340,123,664,945,948,821,319,670,258,849,847,722,808,417,217,431,313,113,692,881
320,682,579,328,546,492,686,555,651,521,905,88,724,292,939,122,307,947,310,825
460,639,467,483,719,406,586,565,657,416,592,651,160,650,710,633,216,531,324,710
889,894,76,243,215,245,298,570,550,320,749,110,518,902,855,853,948,129,819,90
309,282,625,172,777,938,140,290,56,686,266,353,497,671,848,653,130,139,396,735
655,361,332,240,161,219,372,671,680,242,196,998,697,628,667,660,639,550,602,604
552,60,842,744,649,270,661,820,597,254,243,903,603,322,182,652,182,295,652,408
613,607,469,615,614,558,775,597,50,372,5,137,635,703,482,129,146,383,107,824
598,679,897,478,184,243,629,535,654,315,559,15,610,363,181,290,391,621,149,298
221,457,854,468,977,540,527,664,463,722,118,86,323,691,359,744,414,352,709,273
901,569,377,481,774,673,51,90,117,721,637,744,519,75,395,257,733,620,849,458
299,337,174,326,540,423,597,394,852,561,526,677,942,135,739,391,329,360,365,475
561,750,904,415,610,631,155,542,480,283,826,290,244,332,847,342,328,470,253,493
883,622,254,141,459,410,479,156,887,270,452,976,295,598,809,650,744,589,179,85
456,699,372,607,638,855,720,152,528,540,744,595,902,159,650,451,936,609,656,322
565,937,627,308,562,274,238,492,884,291,675,817,882,308,679,261,619,705,409,364
518,623,462,591,126,683,294,650,364,214,640,116,621,553,376,477,411,624,424,148
426,284,270,885,360,85,255,718,89,680,126,272,590,937,605,419,628,469,301,53
275,723,159,636,177,196,668,526,654,732,388,387,272,262,16,926,633,422,117,558
405,151,675,929,928,497,432,428,687,369,727,462,54,129,152,466,295,383,365,630
248,50,526,816,839,227,253,698,180,519,186,852,842,531,160,258,414,385,603,91
523,651,697,562,709,603,21,90,275,479,905,526,381,475,638,278,418,414,611,362
711,274,687,643,709,389,729,225,720,948,675,819,601,412,414,434,375,650,852,377
939,685,627,643,145,275,59,258,524,903,416,635,634,896,834,657,242,466,266,270
296,771,851,676,328,852,357,260,697,52,383,456,774,179,56,905,846,945,15,398
397,412,929,838,279,286,215,845,885,127,715,586,477,930,418,552,459,536,534,292
532,461,404,453,742,269,292,694,437,309,702,56,213,64,187,171,366,661,299,713
747,481,137,520,702,891,534,174,322,946,625,898,592,326,429,852,115,52,178,184
483,936,728,794,888,496,308,256,687,284,588,538,742,296,629,51,603,716,252,890
217,497,948,382,417,327,390,148,701,617,898,529,775,437,916,183,819,676,335,393
937,472,122,288,619,743,660,725,742,313,675,605,383,741,53,69,171,618,125,742
121,376,709,858,710,387,824,468,302,922,884,699,378,582,628,525,890,534,629,459
707,745,410,476,743,307,547,121,482,699,281,309,414,689,728,424,848,140,613,714
880,632,844,627,469,947,399,767,900,185,731,409,826,430,329,50,882,50,405,253
189,922,536,313,385,272,330,932,313,117,132,737,669,182,494,493,702,522,184,609
186,634,287,716,591,55,589,175,306,452,746,694,661,646,855,259,80,221,151,857
477,243,649,546,303,683,285,518,720,367,629,841,371,395,741,333,911,367,750,811
691,693,889,244,461,759,680,932,116,139,654,719,153,260,597,269,627,899,177,883
459,323,125,748,483,370,137,751,991,708,898,149,664,307,392,419,423,256,493,376
882,853,562,694,469,428,219,158,684,587,84,87,464,86,887,712,536,679,700,767
473,623,705,565,470,404,822,409,271,665,87,214,687,880,817,849,213,146,689,190
602,245,713,115,616,639,323,80,176,824,700,240,499,598,810,535,184,187,404,684
938,0,240,433,812,283,673,855,135,156,53,393,727,570,389,216,929,109,416,288
880,401,328,653,694,161,131,747,273,946,647,699,659,309,610,247,807,609,421,69
123,700,841,697,702,279,248,55,592,552,379,185,126,856,803,357,773,568,178,377
325,124,941,826,669,238,636,595,238,934,402,131,188,146,633,436,595,362,191,498
378,632,177,992,177,606,644,626,935,323,332,823,124,380,815,518,619,293,670,821
454,273,118,752,604,526,151,932,294,544,7,462,108,804,407,423,305,134,432,549
143,59,611,463,286,722,132,191,132,712,325,592,548,362,419,108,91,710,359,320
852,905,596,730,532,528,158,116,809,231,570,634,660,681,935,904,401,406,327,695
724,318,660,683,940,635,657,692,366,750,130,463,246,680,24,117,928,608,257,690
123,225,774,336,824,624,267,772,413,180,302,269,179,897,839,596,670,679,295,135
937,291,721,253,665,356,702,292,537,556,804,932,827,695,89,734,108,692,85,708
857,889,149,728,455,461,735,293,643,596,718,274,741,279,881,825,704,298,284,820
395,659,675,588,159,54,296,809,549,707,885,625,723,901,652,677,583,457,811,674
883,238,420,473,664,306,326,650,674,390,627,160,695,196,362,579,703,298,934,287
318,689,777,948,251,530,888,668,612,732,396,604,735,822,925,645,154,613,389,108
266,936,816,376,401,52,518,239,823,732,779,892,602,568,370,897,856,768,331,901
279,622,267,728,771,923,620,417,297,744,646,329,463,545,407,778,345,534,213,399
930,180,624,492,454,380,125,409,312,535,663,132,772,192,817,681,175,704,218,645
379,128,251,902,813,472,84,273,894,273,421,407,251,674,565,555,52,310,303,544
681,180,713,370,248,160,548,718,691,189,978,90,479,676,894,686,262,141,300,639
120,140,686,522,540,131,645,142,554,533,108,59,394,645,841,57,390,762,546,658
311,704,383,750,934,615,608,320,570,724,654,538,714,119,143,252,224,135,660,713
263,633,416,658,925,610,854,887,559,732,627,492,268,21,626,406,470,154,138,298
641,677,827,125,150,552,230,359,405,115,400,749,468,57,672,184,436,659,388,393
437,895,371,529,522,604,751,274,283,399,417,636,71,318,53,186,190,652,472,110
274,673,932,582,325,352,617,883,826,292,882,820,437,124,243,619,547,678,321,216
99,417,938,312,327,337,925,882,594,550,646,128,679,683,590,617,188,682,378,387
271,732,753,561,458,141,461,75,143,935,741,902,728,562,627,218,323,616,559,556
703,703,432,903,846,519,469,391,412,455,527,691,491,710,815,676,171,192,531,547
487,329,86,123,902,547,120,945,116,925,816,271,555,844,667,816,256,217,410,554
115,110,624,559,562,375,262,254,645,414,772,373,307,432,75,458,389,249,81,703
280,256,889,588,536,144,497,113,89,607,852,881,629,617,587,561,983,309,189,180
827,536,118,698,491,898,722,851,467,481,988,855,928,284,261,328,259,175,521,538
315,52,604,656,540,769,424,846,666,930,291,54,58,423,662,140,139,742,720,525
524,890,246,104,663,141,176,73,819,715,570,530,239,255,401,161,671,307,367,87
461,728,660,935,420,805,261,644,255,381,945,637,591,15,902,663,749,846,743,647
150,436,601,269,159,699,675,926,678,416,241,637,482,280,298,526,781,681,778,245
901,530,559,528,620,535,314,141,453,326,778,239,530,148,189,729,808,552,69,334
122,665,283,128,471,270,152,196,246,807,153,109,86,466,125,108,757,714,152,648
707,324,825,587,301,776,822,290,384,824,382,809,930,439,942,181,896,695,279,360
481,678,819,345,275,538,159,710,416,491,297,949,458,385,773,360,895,367,255,945
333,709,741,55,530,455,814,604,292,415,120,149,855,309,573,614,668,404,669,307
435,886,120,410,154,109,147,259,395,669,145,668,306,804,2,499,183,144,691,144
752,424,58,52,241,175,699,638,216,179,807,657,472,547,518,86,902,373,537,768
526,356,355,253,58,921,746,557,708,406,530,998,173,519,555,474,180,469,672,125
694,214,710,390,570,890,689,152,433,644,336,60,881,378,89,692,368,823,491,249
631,665,499,657,389,828,410,255,123,375,53,903,940,754,653,421,253,676,352,173
735,179,690,779,924,54,705,644,847,373,364,547,534,90,529,664,889,358,318,770
723,725,607,321,655,354,421,130,145,949,307,804,600,716,76,437,474,813,692,544
631,685,499,992,922,371,726,374,181,359,688,329,250,406,672,242,882,551,804,122
259,107,642,656,239,604,257,705,386,622,556,946,154,474,56,697,493,439,857,124
437,885,286,111,417,160,82,151,113,711,313,276,160,395,111,560,653,435,683,897
124,382,994,773,177,594,822,300,243,697,615,518,596,453,642,841,495,498,496,296
646,821,364,271,857,492,658,643,699,418,943,364,8,84,636,375,181,922,842,277
857,313,387,932,703,853,314,324,664,769,416,653,498,131,460,881,604,20,171,554
472,533,777,287,626,112,134,608,293,218,54,805,540,326,463,656,175,1,455,143
264,731,620,282,663,646,177,778,749,523,396,124,633,539,492,837,453,881,127,337
303,897,453,213,693,880,743,23,628,595,520,53,221,813,608,184,809,842,613,185
842,547,674,361,382,291,777,302,721,852,519,158,392,537,419,184,142,737,813,630
233,301,677,839,896,545,214,150,461,806,887,148,160,555,727,307,710,142,700,932
83,498,272,693,129,824,710,770,189,855,73,183,729,279,543,23,329,892,670,273
54,664,313,255,645,945,57,496,406,546,180,847,631,542,453,525,845,418,904,999
276,338,55,481,86,274,621,850,623,382,431,273,826,226,458,750,841,275,652,495
556,614,129,769,333,534,276,300,492,190,992,319,491,329,548,142,529,55,397,942
720,218,533,488,943,699,290,609,291,659,298,402,407,325,157,246,157,243,594,611
152,246,483,218,840,449,694,112,700,352,475,773,729,52,108,769,247,534,245,282
187,700,53,939,848,152,133,113,315,729,674,110,494,987,83,589,119,569,540,116
247,114,290,715,646,412,857,921,182,176,607,632,307,773,53,184,683,285,236,562
732,381,244,328,679,775,727,251,619,805,706,827,152,821,551,903,931,702,342,716
401,685,589,389,398,891,813,127,121,420,818,330,523,593,422,87,246,200,319,371
850,856,246,624,462,182,448,335,401,381,681,620,303,645,810,883,569,416,298,594
619,707,309,477,934,624,127,657,57,157,20,196,457,254,292,182,410,742,391,147
817,271,706,467,642,554,695,709,524,596,357,318,777,689,59,223,378,687,352,530
617,935,280,213,637,183,249,332,779,398,905,492,885,455,136,594,306,747,760,693
717,730,410,903,57,92,815,298,522,409,742,680,495,377,266,376,193,126,389,653
282,538,923,654,171,258,743,257,553,628,813,220,156,135,332,529,836,647,302,899
409,73,456,372,534,541,647,354,570,117,56,59,317,807,194,943,558,769,815,431
147,598,490,587,131,779,679,134,536,673,371,419,929,729,854,535,306,927,743,400
354,364,569,717,147,244,654,624,649,700,144,702,188,341,683,647,454,88,299,394
597,751,678,493,899,748,410,479,177,761,521,612,683,536,113,900,895,92,306,658
609,730,722,402,761,731,743,143,365,401,684,897,689,384,411,844,118,359,317,715
379,659,473,399,774,555,291,853,932,587,281,461,142,925,270,602,555,69,600,310
633,674,769,265,694,82,134,180,174,608,378,824,176,56,747,881,108,605,769,885
644,730,589,447,217,522,140,533,900,265,600,613,290,709,408,934,701,216,924,853
338,257,322,123,547,806,188,904,591,381,256,535,594,538,897,940,984,942,388,294
848,663,597,125,287,720,188,87,393,491,171,54,618,221,478,112,438,699,624,378
465,174,640,362,896,718,323,287,398,719,672,606,691,739,724,497,544,803,409,434
761,460,633,263,360,814,731,252,58,752,356,172,928,641,716,374,614,721,558,242
845,324,307,519,127,671,750,709,437,652,219,112,59,682,844,267,653,936,445,561
319,554,716,53,333,422,418,151,149,641,948,186,109,807,405,160,361,424,238,322
545,244,676,311,751,855,704,766,890,532,942,921,359,548,267,264,714,723,895,111
912,308,726,668,238,307,379,619,687,530,275,245,897,369,217,777,614,403,176,940
842,893,238,815,779,407,189,602,605,361,976,927,184,386,606,370,185,921,718,455
148,51,133,250,851,455,191,806,184,846,818,823,284,651,55,51,903,933,709,51
175,607,219,379,527,290,381,529,483,398,884,777,392,452,415,912,334,694,238,295
134,708,622,299,268,452,371,436,893,727,947,498,384,141,520,147,379,630,769,82
359,702,470,918,718,128,892,646,313,695,407,411,729,313,560,58,934,377,189,496
931,464,663,697,160,525,323,317,256,286,678,178,492,422,948,185,355,572,127,316
407,456,568,948,264,949,386,597,393,602,377,924,550,770,311,703,379,327,597,941
495,740,293,407,296,881,431,550,728,625,686,900,596,276,468,127,752,731,467,674
317,644,626,539,274,184,364,395,243,889,333,663,601,83,263,490,338,338,303,528
714,853,279,216,321,769,839,901,922,809,478,940,3,372,771,261,149,267,265,810
150,732,854,684,176,124,266,458,456,738,267,904,678,823,523,602,931,826,363,361
549,742,369,557,774,185,253,21,381,374,390,857,552,896,701,613,596,280,777,588
921,491,492,764,377,891,240,668,404,694,476,381,292,371,395,648,562,821,178,724
694,595,929,522,522,248,942,68,109,625,590,743,50,364,277,273,383,895,324,267
590,326,148,317,747,644,839,397,902,122,669,154,171,365,491,145,50,282,581,394
124,492,84,550,687,181,63,708,461,542,408,569,332,636,730,708,640,436,260,779
593,554,823,369,628,377,177,455,666,557,57,147,678,385,808,475,436,873,471,322
250,723,737,52,778,594,390,187,434,922,654,327,140,244,827,523,532,362,627,724
280,112,471,85,493,59,693,301,180,551,658,318,637,727,926,158,684,397,733,640
382,620,383,81,58,727,805,161,588,476,640,322,596,465,923,274,56,700,124,122
244,821,261,17,722,287,841,814,569,308,286,635,379,903,769,414,885,178,180,649
621,815,593,475,848,668,378,637,135,728,643,496,722,836,589,466,643,544,774,218
176,381,54,368,431,252,253,923,818,728,112,559,761,855,657,528,321,134,809,422
628,946,216,459,217,476,633,391,617,546,377,187,282,825,587,975,709,260,277,714
604,749,462,740,728,893,688,603,182,141,826,374,146,679,311,498,777,523,606,142
109,552,636,215,678,401,306,654,254,941,404,274,427,814,710,266,283,466,809,279
901,670,94,304,644,672,325,900,50,693,880,493,670,622,812,946,888,239,408,625
779,263,560,134,404,407,108,188,526,635,570,112,437,313,846,628,488,380,935,322
441,713,942,379,117,702,569,473,518,653,894,839,818,495,616,142,670,288,116,559
569,308,826,465,539,539,849,248,467,716,478,221,887,811,225,173,142,240,310,842
148,406,883,195,615,362,536,253,393,177,616,562,295,415,523,896,650,846,243,548
320,188,840,189,523,247,158,447,607,394,776,842,718,117,725,747,110,73,75,465
949,180,181,475,588,496,933,700,416,305,18,714,779,682,770,335,657,602,472,945
246,77,590,697,810,491,158,670,936,296,724,633,402,745,929,367,273,361,549,73
929,943,712,386,882,666,743,360,140,821,472,745,551,303,132,86,846,20,618,842
421,238,11,817,111,545,695,651,654,840,634,296,50,632,385,642,146,549,89,675
356,650,240,202,216,253,851,556,697,111,546,293,663,818,828,719,366,849,274,851
615,397,402,590,629,694,541,932,178,311,335,534,721,928,678,118,770,917,689,718
713,593,390,534,188,295,365,621,844,153,382,547,641,720,520,355,659,889,157,996
69,245,479,255,494,618,818,158,83,853,603,929,189,130,242,525,57,360,431,716
73,289,458,611,69,134,704,145,415,127,397,811,599,935,648,743,418,466,310,587
844,597,338,477,400,742,895,659,902,464,895,218,521,772,110,54,149,838,315,562
769,399,706,130,856,312,566,465,810,238,592,807,848,433,136,354,92,174,929,52
219,499,278,562,537,63,779,240,364,775,628,435,74,843,905,547,176,54,120,297
658,248,155,556,213,196,541,641,382,933,238,368,775,79,338,629,686,266,86,400
409,741,554,284,492,537,91,132,848,113,840,302,855,413,439,665,172,542,322,252
819,122,685,935,414,387,624,53,746,637,338,245,114,256,387,596,10,120,770,817
664,846,181,150,413,283,766,466,724,929,257,188,558,366,925,523,273,656,654,483
620,397,229,287,184,454,647,327,216,776,310,719,125,183,459,594,433,279,155,142
112,648,644,155,394,924,189,406,154,405,171,726,364,569,749,529,550,513,307,840
662,240,468,235,452,289,329,806,179,588,414,824,51,621,643,273,817,53,715,128
179,807,537,53,242,740,213,555,751,528,160,680,184,435,356,258,675,433,419,528
771,499,594,635,938,940,810,354,55,644,548,690,133,364,68,727,247,90,823,693
849,748,358,638,899,357,435,329,83,419,629,847,731,352,238,526,243,79,51,196
542,308,428,637,718,410,93,240,481,722,287,93,692,807,923,176,149,310,550,552
306,975,900,315,216,479,743,494,901,535,597,924,239,186,925,124,491,750,588,323
76,929,694,844,114,410,842,941,307,377,553,528,481,858,243,771,818,614,535,749
899,143,342,888,256,750,465,173,855,887,312,827,714,452,550,776,845,242,839,250
525,387,844,731,185,261,935,895,331,840,928,726,821,709,896,891,680,340,172,742
153,93,639,469,947,776,336,362,75,387,310,711,630,282,402,469,567,538,455,695
817,395,849,456,275,645,310,382,240,255,296,926,267,354,760,219,529,810,813,559
610,118,495,624,493,119,628,491,715,266,420,690,586,411,16,496,902,405,841,146
221,375,534,309,390,616,521,704,853,645,353,221,497,493,395,939,752,3,544,844
823,302,638,522,157,616,178,339,705,988,610,467,84,466,886,898,650,814,940,300
191,189,59,329,596,884,728,921,214,679,335,308,752,136,534,494,475,937,551,606
852,633,407,371,608,645,627,59,813,189,586,708,522,598,59,353,71,888,325,174
805,840,110,69,923,294,658,608,86,693,903,253,181,155,420,688,55,55,750,904
396,454,155,431,894,178,473,312,937,295,24,75,498,339,818,676,161,270,244,138
365,597,419,818,216,729,707,464,371,383,772,189,217,367,295,819,990,805,391,586
93,278,65,161,469,701,601,714,849,274,569,196,75,544,57,57,411,418,413,147
646,270,632,405,303,676,499,478,559,410,709,395,81,321,647,609,247,153,816,126
769,466,193,602,529,327,335,215,930,121,743,609,306,288,332,725,217,399,619,819
827,296,445,618,778,897,238,691,474,723,679,215,934,179,528,645,620,359,499,890
401,812,352,813,533,274,675,698,121,175,409,774,411,402,348,626,481,898,589,298
745,819,605,815,87,276,352,821,301,171,937,710,525,327,305,749,930,904,635,753
646,56,534,523,287,271,713,738,115,889,92,750,700,655,113,946,110,747,615,545
806,288,122,176,52,466,453,539,757,218,337,453,383,474,939,660,892,384,115,383
437,803,570,466,458,284,687,405,279,374,393,297,634,369,317,192,494,690,689,260
359,759,606,108,544,300,239,856,550,117,933,401,660,624,457,728,688,685,605,57
616,125,698,214,934,115,182,299,5,276,244,822,688,295,559,261,770,903,357,724
"""

enum Constant {
    enum Input {
        static let myTicket = "your ticket:"
        static let nearbyTickets = "nearby tickets:"
    }
}

struct Requirement {
    let positions: [String]
    let positionValues: [String: [Int]]
}

struct Ticket {
    let values: [Int]
}

struct MyTicket {
    let positions: [String: Int]
}

func parseRequirement(input: String) -> Requirement {
    let components = input.components(separatedBy: .newlines)
    var i = 0
    var component = components[i]

    var positions = [String]()
    var positionValues = [String: [Int]]()
    var currentPosition = ""

    while component != Constant.Input.myTicket {
        if let nameSeparatorIndex = component.firstIndex(of: ":") {
            currentPosition = String(component.prefix(upTo: nameSeparatorIndex))
            positions.append(currentPosition)
        }

        component
            .components(separatedBy: .whitespaces)
            .forEach { lineComponent in
                guard lineComponent.contains("-") else { return }

                let numbers = lineComponent.components(separatedBy: "-")
                
                guard let firstNumberString = numbers.first,
                      let lastNumberSrting = numbers.last,
                      let firstNumber = Int(firstNumberString),
                      let lastNumber = Int(lastNumberSrting)
                else {
                    return
                }

                for i in firstNumber...lastNumber {
                    positionValues[currentPosition, default: [Int]()].append(i)
                }
            }

        i += 1
        component = components[i]
    }

    return Requirement(positions: positions, positionValues: positionValues)
}

func parseMyTicket(input: String) -> Ticket {
    let components = input.components(separatedBy: .newlines)
    var i = 0
    var component = components[i]

    while component != Constant.Input.myTicket {
        i += 1
        component = components[i]
    }

    return Ticket(
        values: components[i + 1]
            .components(separatedBy: ",")
            .compactMap { Int($0) })
}

func parseNearbyTickets(input: String) -> [Ticket] {
    let components = input.components(separatedBy: .newlines)
    var result = [Ticket]()
    var i = 0
    var component = components[i]

    while component != Constant.Input.nearbyTickets {
        i += 1
        component = components[i]
    }

    while i < components.count - 1 {
        i += 1
        result.append(
            Ticket(
                values: components[i]
                    .components(separatedBy: ",")
                    .compactMap { Int($0) }))
    }

    return result
}

func findInvalidRequirements(
    _ requirement: Requirement,
    in nearbyTickets: [Ticket]
) -> [Int] {
    let allRequirements = requirement.positionValues.values.reduce([Int](), +)
    var result = [Int]()

    for ticket in nearbyTickets {
        for number in ticket.values {
            if allRequirements.firstIndex(of: number) == nil {
                result.append(number)
            }
        }
    }

    return result
}

func discardInvalidtickets(
    from nearbyTickets: [Ticket],
    invalidRequirements: [Int]
) -> [Ticket] {
    var result = nearbyTickets

    invalidRequirements.forEach { requirement in
        result.removeAll(where: { $0.values.firstIndex(of: requirement) != nil })
    }

    return result
}

func determinePositionsOrder(
    requirement: Requirement,
    nearbyTickets: [Ticket]
) -> [String] {
    var result = [String: Int]()
    var allPositions = requirement.positions
    var possiblePosition: String?

    guard let startTicket = nearbyTickets.first else { return [] }

    while !allPositions.isEmpty {
        var currentPositionIndex = 0
        var allFoundMatches = [[String]]()

        while currentPositionIndex < startTicket.values.count {
            var foundMatches = [String]()

            for position in allPositions {
                guard let value = requirement.positionValues[position],
                      value.contains(startTicket.values[currentPositionIndex]) else {
                    possiblePosition = nil
                    continue
                }

                possiblePosition = position

                for anotherTicket in nearbyTickets {
                    guard value.contains(anotherTicket.values[currentPositionIndex]) else {
                        possiblePosition = nil
                        break
                    }
                }

                if let definitePosition = possiblePosition {
                    foundMatches.append(definitePosition)
                    possiblePosition = nil
                }
            }

            allFoundMatches.append(foundMatches)
            currentPositionIndex += 1
            possiblePosition = nil
        }

        guard let foundSingleMatchArray = allFoundMatches.filter({ $0.count == 1 }).first,
              let foundMatch = foundSingleMatchArray.first,
              let foundIndex = allPositions.firstIndex(of: foundMatch)
        else {
            fatalError("Something went terribly wrong.")
        }

        result[foundMatch] = allFoundMatches.firstIndex(of: foundSingleMatchArray)
        allPositions.remove(at: foundIndex)
    }

    return result.keys.sorted(by: { (result[$0] ?? 0) < (result[$1] ?? 0) })
}

func myTicket(_ ticket: Ticket, positions: [String]) -> MyTicket {
    var i = 0
    var determinedPositions = [String: Int]()
    while i < positions.count {
        determinedPositions[positions[i]] = ticket.values[i]
        i += 1
    }
    return MyTicket(positions: determinedPositions)
}

print(findInvalidRequirements(
        parseRequirement(input: input),
        in: parseNearbyTickets(input: input)))

print(myTicket(
        parseMyTicket(input: input),
        positions: determinePositionsOrder(
            requirement: parseRequirement(input: input),
            nearbyTickets: discardInvalidtickets(
                from: parseNearbyTickets(input: input),
                invalidRequirements: findInvalidRequirements(
                    parseRequirement(input: input),
                    in: parseNearbyTickets(input: input)))))
        .positions
        .filter { $0.key.starts(with: "departure") }
        .reduce(1) { $0 * $1.value })
