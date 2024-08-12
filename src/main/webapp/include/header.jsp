<!-- ======= Header ======= -->
  <%@page import="com.dto.ProjectDto"%>
<%@page import="com.service.ProjectService"%>
<%@page import="com.service.LogFileService"%>
<%@page import="com.dto.UserDto"%>
<%@page import="com.service.UserService"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<header id="header" class="header fixed-top d-flex align-items-center">
<%@include file="../UserTrack.jsp"%> 
<% 	
		/* String c_y_session = "2023"; */
		/* String old_session = "2022-2023"; */
		String c_y_session = "2022-2023";
    	
    %>

 <%
	String current_date = LogFileService.changeFormateOfCurrentDate("yyyy-MM-dd");

 	UserService user_sidebar_ser = new UserService(); 
 	UserDto user_sidebar_dto = user_sidebar_ser.getuserInfoById(user_id, config, request);

 	MsgService msg_ser = new MsgService(); 
 	MsgDto msg_dto = msg_ser.getMsgInfoById(1, config, request);


	String activation_date =project_head_dto.getActivation_date();
	
	
	
	
	if(activation_date==null){
		
		
	}
	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");      
    
	Date date1 = formatter.parse(activation_date);  
    Date date2 = formatter.parse(current_date);    
    Boolean expire = date1.before(date2);
	
	if(expire){
		response.sendRedirect("login.jsp?msg=expired");
		
	}
	%>
	 <input type="hidden"  id="current_date" value="<%=current_date%>">
    <div class="d-flex align-items-center justify-content-between">
      <i class="bi bi-list toggle-sidebar-btn"></i>
     
      <a href="index.jsp" class="logo d-flex pb-3" style="display: flex!important;flex-wrap: wrap;justify-content: space-evenly;"> <!-- <img src="ProjectImage/1.jpg" alt=""> --> <span class="d-lg-block pt-3"><%=project_head_dto.getNAME()%></span>
		</a>
      
    </div><!-- End Logo -->
    	<input type="hidden" name="Session_year" value="<%=session_year%>">
    

     
    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">




        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <!-- <img src="assets/img/user.png" alt="Profile" class="rounded-circle"> -->
            <i class="fa fa-user"></i><span class="d-none d-md-block dropdown-toggle ps-2"><%=user_sidebar_dto.getName() %>
            </span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6><%=user_sidebar_dto.getName() %></h6>
              <span>User</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="user_profile.jsp">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
            
              <hr class="dropdown-divider">
            </li>

            
<li>
              <a id="downloadButton" onclick="backup();" class="dropdown-item d-flex align-items-center">
                <i class="fa-solid fa-file-arrow-down"></i>
                <span >Download Backup</span>
              </a>
            </li>
              <li>
              <a class="dropdown-item d-flex align-items-center" href="edit_project.jsp?id=<%=project_head_dto.getId()%>">
           
                <i class="bi bi-box-arrow-right"></i>
                <span>View Project</span>
              </a>
            </li>
             <li>
              <a class="dropdown-item d-flex align-items-center" href="edit_msg.jsp?id=1">
           
                <i class="bi bi-box-arrow-right"></i>
                <span>Msg</span>
              </a>
            </li>
            <li>
            
              <a class="dropdown-item d-flex align-items-center" href="logout.jsp">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->
  <div class="download-container" id="download-container">
    <!-- <span class="close-button" onclick="hideDownload()">
      <i class='bx bx-x'></i>
    </span> -->
    <div class="download-content">
      <h2>Wait, File is Downloading</h2>
      <div class="custom-progress-container">
        <div class="custom-progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
      </div>
      <div class="progress-text">0%</div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <script> function backup() {
        	//openDirectoryDialog();
        	//alert("Start");
        	showDownload();
        	//showLoader()
            // Send an AJAX request to trigger the backup process
            $.ajax({
                url: "backup.jsp",
                type: "POST",
                success: function(response) {
                	//alert(response);
                	//hideDownload();
                	//hideLoader();
                    console.log(response); // Print the backup status to the browser console
                   // window.location.href = "download.jsp"; // Redirect to the download page
                   //hideDownload();
                },
                error: function(xhr, status, error) {
                	alert("error");
                    console.error(error); // Print any errors to the browser console
                }
            });
        }
        
			var progressBar = document.querySelector('.custom-progress-bar');
			var progressText = document.querySelector('.progress-text');
			var interval;

			function startDownload() {
			  clearInterval(interval); // Clear any existing interval
			  progressBar.style.width = '0%'; // Reset the progress bar width to 0%
			  progressText.textContent = '0%'; // Reset the progress text to 0%
			  interval = setInterval(progress, 100);
			}

			function progress() {
			  var width = parseInt(progressBar.style.width); // Get the current progress bar width
			  if (isNaN(width) || width >= 100) {
			    width = 0; // Reset width to 0 if it's not a number or already at 100%
			  }
			  
			  width += 10;
			  progressBar.style.width = width + '%';
			  progressText.textContent = width + '%';
			  
			  if (width >= 100) {
			    clearInterval(interval);
			    hideDownload();
			  }
			}




	
   
    
    function hideDownload() {
        var downloadContainer = document.getElementById("download-container");
        downloadContainer.style.display = "none";
      }
    function showDownload() {
    	
          var downloadContainer = document.getElementById("download-container");
          downloadContainer.style.display = "flex";
          //alert("Start download");
          startDownload();
          
       }
  </script>