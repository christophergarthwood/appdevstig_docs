# GOPS Cronjob
## Daily File Copy Metrics

*File Totals*

|Parameter         | Total Files     | Avg Bytes(M)    | Total Load(GB)  | Pattern                                                                          |
|------------------|-----------------|-----------------|-----------------|----------------------------------------------------------------------------------|
|a_490             |              190|              125|               23|  find /home/aps/optics/gops_rs/lvl5 -name *a_490_lmi.nc -print                    |
|bb_490            |              190|              146|               27|  find /home/aps/optics/gops_rs/lvl5 -name *bb_490_lmi.nc -print                   |
|merged_a490       |               31|              164|                5|  find /home/aps/optics/gops_rs/lvl5 -name merged*L5.1113m*a_490_lmi.nc -print     |
|merged_bb490      |               31|              189|                5|  find /home/aps/optics/gops_rs/lvl5 -name merged*L5.1113m*bb_490_lmi.nc -print    |
|merged_10D_490    |               31|              302|                9|  find /home/aps/optics/gops_rs/lvl5 -name merged*L5.10D*a_490_lmi.nc -print       |
|merged_10D_bb490  |               31|              357|               11|  find /home/aps/optics/gops_rs/lvl5 -name merged*L5.10D*bb_490_lmi.nc -print      |
 
80 (GB) total space at day of year 189.

### General Execution time for Copy

real    32m44.188s

user    0m1.595s

sys 2m1.416s

### Example Results
+ 1.6G    /projects/socom/visor_gops/lvl5/2020066.0306
+ 1.7G    /projects/socom/visor_gops/lvl5/2020087.0327
+ 1.7G    /projects/socom/visor_gops/lvl5/2020089.0329
+ 109M    /projects/socom/visor_gops/lvl5/2020111.0420
+ 1.7G    /projects/socom/visor_gops/lvl5/2020088.0328
+ 1.7G    /projects/socom/visor_gops/lvl5/2020074.0314
+ 107M    /projects/socom/visor_gops/lvl5/2020115.0424
+ 112M    /projects/socom/visor_gops/lvl5/2020113.0422
+ 1.7G    /projects/socom/visor_gops/lvl5/2020063.0303
+ 1.7G    /projects/socom/visor_gops/lvl5/2020076.0316
+ 1.6G    /projects/socom/visor_gops/lvl5/2020065.0305
+ 1.6G    /projects/socom/visor_gops/lvl5/2020061.0301
+ 1.7G    /projects/socom/visor_gops/lvl5/2020070.0310
+ 1.7G    /projects/socom/visor_gops/lvl5/2020083.0323
+ 1.7G    /projects/socom/visor_gops/lvl5/2020075.0315
+ 110M    /projects/socom/visor_gops/lvl5/2020114.0423
+ 1.6G    /projects/socom/visor_gops/lvl5/2020068.0308
+ 1.3G    /projects/socom/visor_gops/lvl5/2020078.0318
+ 1.7G    /projects/socom/visor_gops/lvl5/2020091.0331
+ 1.7G    /projects/socom/visor_gops/lvl5/2020062.0302
+ 1.6G    /projects/socom/visor_gops/lvl5/2020067.0307
+ 1.7G    /projects/socom/visor_gops/lvl5/2020081.0321
+ 1.7G    /projects/socom/visor_gops/lvl5/2020082.0322
+ 1.7G    /projects/socom/visor_gops/lvl5/2020072.0312
+ 1.7G    /projects/socom/visor_gops/lvl5/2020064.0304
+ 1.6G    /projects/socom/visor_gops/lvl5/2020077.0317
+ 1.7G    /projects/socom/visor_gops/lvl5/2020084.0324
+ 1.7G    /projects/socom/visor_gops/lvl5/2020086.0326
+ 1.6G    /projects/socom/visor_gops/lvl5/2020069.0309
+ 1.7G    /projects/socom/visor_gops/lvl5/2020073.0313
+ 1.7G    /projects/socom/visor_gops/lvl5/2020071.0311
+ 114M    /projects/socom/visor_gops/lvl5/2020112.0421
+ 1.7G    /projects/socom/visor_gops/lvl5/2020079.0319
+ 1.7G    /projects/socom/visor_gops/lvl5/2020085.0325
+ 1.6G    /projects/socom/visor_gops/lvl5/2020080.0320
+ 1.5G    /projects/socom/visor_gops/lvl5/2020090.0330

51G /projects/socom/visor_gops/lvl5

