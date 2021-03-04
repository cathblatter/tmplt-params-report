# this file creates a simple summary tables
# the calculation is made 



# 1. Leadership -----------------------------------------------------------
# calculate the overall table
tbl_leadership_global <- calc_global_tbl(df = filtered_data, 
                                        columns = vec_leadership)


# calculate the table per unit
tbl_leadership_unit <- calc_unit_tbl(df = filtered_data, 
                                     columns = vec_leadership)

