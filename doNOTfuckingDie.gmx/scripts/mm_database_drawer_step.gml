/// mm_database_drawer_step()


if(instance_exists(cursor) && instance_exists(db) && createWithMouse)
{
    chunk_size_pixels = tile_size_pixels * db.chunk_size;

    chunk_x = floor(cursor.x/chunk_size_pixels);
    chunk_y = floor(cursor.y/chunk_size_pixels);    
    chunk_x_in_room = chunk_x * chunk_size_pixels;
    chunk_y_in_room = chunk_y * chunk_size_pixels;
    
    if(mouse_check_button_pressed(mb_left))
    {
        with(db)
        {
            if( true /* chunk not on json */ )
            {
                mm_database_load_chunk(other.chunk_x, other.chunk_y);
                mm_database_create_blueprints(other.chunk_x, other.chunk_y);
                mm_database_save_blueprints();
            }
            
        }
    }
    
    if(mouse_check_button_pressed(mb_right))
    {
        //attempt_delete_chunk(chunk_x, chunk_y);
    }
}
