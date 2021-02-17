# Logo Image Width Lookup Table

A handy note to keep tracking the width of each logo images used in the carousel.

For now we need to manually work out some numbers for <https://github.com/uc-cdis/gen3.org/blob/testcolorssubitems/assets/sass/slider.scss#L16-L17> and <https://github.com/uc-cdis/gen3.org/blob/testcolorssubitems/assets/sass/slider.scss#L54-L55> after changing any logo in the carousel to make the animation looks right.

Currently these numbers mentioned in above links are calculated on assumption that each logo is 50px in height and has L/R padding of 40px on each side.

|    | Env Name | Logo Name    | Original Size | Width in Carousel<br>(Height=50px) |
| -- | -------- | ------------ | ------------- | ---------------------------------- |
| 1  | ACCOuNT  | acct.png     | 612 * 176     | 174                                |
| 2  | AnVIL    | anvil.png    | 150 * 125     | 60                                 |
| 3  | BloodPAC | bloodpac.png | 714 * 280     | 128                                |
| 4  | Canine   | canine.png   | 975 * 276     | 177                                |
| 5  | PRC      | covid19.png  | 1400 * 207    | 338                                |
| 6  | CRDC     | crdc.png     | 1178 * 206    | 286                                |
| 7  | EDC      | edc.png      | 300 * 220     | 68                                 |
| 8  | GenoMEL  | genomel.png  | 1095 * 270    | 203                                |
| 9  | IBDGC    | ibdgc.png    | 804 * 221     | 182                                |
| 10 | KF       | kf.png       | 646 * 270     | 120                                |
| 11 | MIDRC    | midrc.png    | 558 * 169     | 165                                |
| 12 | NCT      | nct.png      | 783 * 106     | 369                                |
| 13 | BDCAT    | bdcat.png    | 3028 * 578    | 262                                |
| 14 | VPODC    | vpodc.png    | 761 * 200     | 190                                |

Total: 2722 (sum of all width) + (40 + 40) * 14 (paddings) = 3842px
