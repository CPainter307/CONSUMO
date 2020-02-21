var xgoal = argument0;   /// X coordinates where we want to go
var ygoal = argument1;  /// Y coordinate where we want to go
path_building = path_add(); /// Create a path where we will add all the points
var value;   /// Value in the enemy grid
var x_previous ; /// Coordinate of X previous
var a = -1 ;  /// Use when enemy falls. We will store data from grid_pathfinding
var b = -1 ;  /// Use when enemy falls. We will store data from grid_pathfinding
var n = 0 ;  /// Use when enemy falls.

path_add_point(path_building, xgoal*oGrid.cell_width + (oGrid.cell_width/2), ygoal*oGrid.cell_height +(oGrid.cell_height/2), 100); /// Initialize the first point of the path
value = ds_grid_get(ds_gridpathfinding,xgoal,ygoal) ; /// Value in grid pathfinding of the goal position

for (var i = value-1; i > 0 ; i -= 1)
{
    x_previous=xgoal ;  // We put in x previous the variable xgoal.
    n=0;
        if ds_grid_value_exists(ds_gridpathfinding, xgoal-1,ygoal, xgoal+1,ygoal+1, i)  /// Check if left / right, jump 1 block vertically left right
           {
           xgoal = ds_grid_value_x(ds_gridpathfinding, xgoal-1,ygoal, xgoal+1,ygoal+1,i);  // Store the X coordinate in xgoal
           ygoal = ds_grid_value_y(ds_gridpathfinding, x_previous-1,ygoal, x_previous+1,ygoal+1,i); // Store the Y coordinate in ygoal
           path_add_point(path_building, xgoal*oGrid.cell_width + (oGrid.cell_width/2), ygoal*oGrid.cell_height +(oGrid.cell_height/2), 100); // Add point in path
           }
                else   
                {
                    if ds_grid_value_exists(ds_gridpathfinding, xgoal-2,ygoal, xgoal+2,ygoal+1, i) /// Check if diagonal jump (big jump) or Horizontal jump (jump over a void)
                    {
                    xgoal = ds_grid_value_x(ds_gridpathfinding, xgoal-2,ygoal, xgoal+2,ygoal+1,i);
                        if ds_grid_get (ds_gridpathfinding, x_previous + sign(xgoal-x_previous), ygoal) == -1 /// Check if enemy could really jump
                        {
                        ygoal = ds_grid_value_y(ds_gridpathfinding, x_previous-2,ygoal, x_previous+2,ygoal+1,i);
                        path_add_point(path_building, xgoal*oGrid.cell_width + (oGrid.cell_width/2), ygoal*oGrid.cell_height +(oGrid.cell_height/2), 100);
                        }
                            else {      /// Case where he find a O_Collsiion, means that we cannot reach it. Means that we have to fall.
                                    {
                                    do
                                       {
                                       n=n+1 ;
                                       a= ds_grid_get(ds_gridpathfinding,x_previous-1,ygoal-n);
                                       b= ds_grid_get(ds_gridpathfinding,x_previous+1,ygoal-n);
                                       }
                                    until (a==i) || (b==i) || ((ygoal-n) < 0)
                                    }
                                            if ds_grid_value_exists(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal-n, i)
                                            {
                                               xgoal = ds_grid_value_x(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal,i);
                                               ygoal = ds_grid_value_y(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal,i);
                                               path_add_point(path_building, xgoal*oGrid.cell_width + (oGrid.cell_width/2), ygoal*oGrid.cell_height +(oGrid.cell_height/2), 100);
                                            }
                                }
                    }
                                    else{  /// When enemy fall
                                            {
                                            do
                                               {
                                               n=n+1 ;
                                               a= ds_grid_get(ds_gridpathfinding,x_previous-1,ygoal-n);
                                               b= ds_grid_get(ds_gridpathfinding,x_previous+1,ygoal-n);
                                               }
                                                until (a==i) || (b==i) || ((ygoal-n) < 0)
                                            }
                                                if ds_grid_value_exists(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal-n, i)
                                                {
                                                   xgoal = ds_grid_value_x(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal,i);
                                                   ygoal = ds_grid_value_y(ds_gridpathfinding, x_previous-1,ygoal-n, x_previous+1,ygoal,i);
                                                   path_add_point(path_building, xgoal*oGrid.cell_width + (oGrid.cell_width/2), ygoal*oGrid.cell_height +(oGrid.cell_height/2), 100);
                                                }

                                        }
                }
}


path_add_point(path_building, floor(x/oGrid.cell_width)*oGrid.cell_width+(oGrid.cell_width/2),floor(y/oGrid.cell_height)*oGrid.cell_height+(oGrid.cell_height/2), 100);  /// We add the last point which is the point where there is the enemy.
//path_set_closed (path_building,0); /// We didn't close the path because it is an open path. We don't to have loop in this path.
//path_reverse (path_building);  // We reverse the path because we start from the end.