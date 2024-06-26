/// mm_database_drawer_step()


if(instance_exists(cursor) && instance_exists(db) && createWithMouse)
{
    tile_size_pixels = db.tile_size_pixels;
    chunk_size_pixels = tile_size_pixels * db.chunk_size;

    chunk_x = floor(cursor.x/chunk_size_pixels);
    chunk_y = floor(cursor.y/chunk_size_pixels);    
    chunk_x_in_room = chunk_x * chunk_size_pixels;
    chunk_y_in_room = chunk_y * chunk_size_pixels;
    
    //print_vars("cursor.x", cursor.x, "cursor.y", cursor.y, "chunk_x", chunk_x, "chunk_y", chunk_y);
        
    if(mouse_check_button_pressed(mb_left))
    {
        with(db)
        {
            if( !mm_chunk_blueprint_exists(other.chunk_x, other.chunk_y) )
            {
                if (!mm_database_load_chunk(other.chunk_x, other.chunk_y))
                    error("chunk blueprint doesnt exists but the raw perlin data does? wtf????", 0);
                mm_database_create_blueprints(other.chunk_x, other.chunk_y);
                mm_database_save_blueprints();
            }
            if( is_undefined(instantiator.chunks_entities[? mm_chunk_coords_to_key(other.chunk_x, other.chunk_y)]) )
            {
                var cx = other.chunk_x;
                var cy = other.chunk_y;
                with(instantiator)
                {
                    mm_instantiator_instantiate_chunk(cx, cy);
                }
            }
            
        }
    }
    
    if(mouse_check_button_pressed(mb_right))
    {
        //attempt_delete_chunk(chunk_x, chunk_y);
    }
    
    if( keyboard_check(vk_control) && keyboard_check_pressed(ord("D")) )
    {
        with(db){ mm_database_delete_all_data(); }
        print("Database wiped");
    }
}
