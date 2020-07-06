    <nav class="navbar navbar-expand-lg navbar-light bg-light sticky-header">
        <a class="navbar-brand" href="#">Navbar</a>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home </a>
                </li>

                <li class="nav-item dropdown" id="user_dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin panel
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="dropdown">
                        <a class="dropdown-item" href="#">Stats</a>
                        <a class="dropdown-item" href="#">Forms creation</a>
                        <!-- <a class="dropdown-item" href="#">Something else here</a> -->
                    </div>
                </li>

                <li class="nav-item dropdown" id="user_dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <?php 
                            echo $username; 
                        ?>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink" id="dropdown">
                        <a class="dropdown-item" href="#">Logout</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                    </div>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" href="#">Disabled</a>
                </li>
            </ul>
        </div>
    </nav>