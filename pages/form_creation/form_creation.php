<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta content='IE=edge' http-equiv='X-UA-Compatible'/>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1' name='viewport'/>
    <title>jQuery sidebar-nav: Responsive Admin Menu Demo</title>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href='SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
  </head>
  <body>
    <aside class="sidebar-left">
      <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".collapse" aria-expanded="false">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SAKEC</a>
          </div>
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="sidebar-menu">
              <li class="header">MAIN NAVIGATION</li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Dashboard v1</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Dashboard v2</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-files-o"></i>
                <span>Layout Options</span>
                <span class="label label-primary pull-right">4</span>
                </a>
                <ul class="treeview-menu" style="display: none;">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Top Navigation</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Boxed</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Fixed</a></li>
                  <li class=""><a href="#"><i class="fa fa-circle-o"></i> Collapsed Sidebar</a>
                  </li>
                </ul>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-th"></i> <span>Widgets</span>
                <small class="label pull-right label-info">new</small>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-pie-chart"></i>
                <span>Charts</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> ChartJS</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Morris</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Flot</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Inline charts</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-laptop"></i>
                <span>UI Elements</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> General</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Icons</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Buttons</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Sliders</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Timeline</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Modals</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-edit"></i> <span>Forms</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> General Elements</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Advanced Elements</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Editors</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-table"></i> <span>Tables</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Simple tables</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Data tables</a></li>
                </ul>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-calendar"></i> <span>Calendar</span>
                <small class="label pull-right label-danger">3</small>
                </a>
              </li>
              <li>
                <a href="#">
                <i class="fa fa-envelope"></i> <span>Mailbox</span>
                <small class="label pull-right label-warning">12</small>
                </a>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-folder"></i> <span>Examples</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Invoice</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Profile</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Login</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Register</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Lockscreen</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> 404 Error</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> 500 Error</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Blank Page</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Pace Page</a></li>
                </ul>
              </li>
              <li class="treeview">
                <a href="#">
                <i class="fa fa-share"></i> <span>Multilevel</span>
                <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                  <li>
                    <a href="#"><i class="fa fa-circle-o"></i> Level One <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu">
                      <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                      <li>
                        <a href="#"><i class="fa fa-circle-o"></i> Level Two <i class="fa fa-angle-left pull-right"></i></a>
                        <ul class="treeview-menu">
                          <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                          <li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>
                        </ul>
                      </li>
                    </ul>
                  </li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>
                </ul>
              </li>
              <li><a href="#"><i class="fa fa-book"></i> <span>Documentation</span></a></li>
              <li class="header">LABELS</li>
              <li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>
              <li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>
              <li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>
            </ul>
          </div>
          <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
      </nav>
    </aside>

    <div class="content container-fluid">
    	<div class="col-sm-12">
    	<div class="container">
    		<label>1.</label>
    		<input type="text" placeholder="Question Area" style="height:100px;width:500px">
    		<label for="type">Type:</label>
    		<select name="type">
    			<option value="text">Text</option>
    			<option value="radio">Radio</option>
    			<option value="multiplechoice">Multiple Choice</option>
    		</select>
    		<!-- <div class="float-right">
	    		<label>Option 1:</label>
	    		<input type="text" style="width:300px"><br>
	    		<label>Option 2:</label>
	    		<input type="text" style="width:300px"><br>
	    		<label>Option 3:</label>
	    		<input type="text" style="width:300px"><br>
	    		<label>Option 4:</label>
	    		<input type="text" style="width:300px">
    		</div> -->
    		<br>
    		<button type="submit">Save</button>
    		<button class="text-danger">Delete</button>
    	</div>
    	<div class="container">
    		<label>2.</label>
    		<input type="text" placeholder="Question Area" style="height:100px;width:500px">
    		<label for="type">Type:</label>
    		<select name="type">
    			<option value="text">Text</option>
    			<option value="radio">Radio</option>
    			<option value="multiplechoice">Multiple Choice</option>
    		</select>
    		<br>
    		<button type="submit">Save</button>
    		<button class="text-danger">Delete</button>
    	</div>
    	<div class="container">
    		<label>3.</label>
    		<input type="text" placeholder="Question Area" style="height:100px;width:500px">
    		<label for="type">Type:</label>
    		<select name="type">
    			<option value="text">Text</option>
    			<option value="radio">Radio</option>
    			<option value="multiplechoice">Multiple Choice</option>
    		</select>
    		<br>
    		<button type="submit">Save</button>
    		<button class="text-danger">Delete</button>
    	</div>
    	<div class="container">
    		<label>4.</label>
    		<input type="text" placeholder="Question Area" style="height:100px;width:500px">
    		<label for="type">Type:</label>
    		<select name="type">
    			<option value="text">Text</option>
    			<option value="radio">Radio</option>
    			<option value="multiplechoice">Multiple Choice</option>
    		</select>
    		<br>
    		<button type="submit">Save</button>
    		<button class="text-danger">Delete</button>
    	</div>
    	<div class="container">
    		<label>5.</label>
    		<input type="text" placeholder="Question Area" style="height:100px;width:500px">
    		<label for="type">Type:</label>
    		<select name="type">
    			<option value="text">Text</option>
    			<option value="radio">Radio</option>
    			<option value="multiplechoice">Multiple Choice</option>
    		</select>
    		<br>
    		<button type="submit">Save</button>
    		<button class="text-danger">Delete</button>
    	</div>
    </div>
	</div>
    
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src='SidebarNav.min.js' type='text/javascript'></script>
  <script>
      $('.sidebar-menu').SidebarNav()
    </script>

    <script type="text/javascript">
    	
    </script>
    
  </body>
</html>


