/// text_destroy(text_id)

var l=argument0;

var text=l[| 0], surf=l[| 1];

if surface_exists(surf)
    surface_free(surf)
ds_list_destroy(l)
