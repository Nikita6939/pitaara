<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Arrays"%>
<%@page import="com.example.demo.bean.Artist"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pitaara Admin Panel</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
<!-- Custom CSS -->
<!-- <link rel="stylesheet" href="../styles.css"> -->
<link rel="stylesheet" href="css/styles.css" type="text/css">
<!-- Google Fonts (Montserrat) -->
<link
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="container-fluid">
		<div class="row">


			<jsp:include page="sidebar.jsp"></jsp:include>

			<!-- Main Content -->
			<div class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
				<div class="" id="addArtistModal" tabindex="-1" aria-hidden="true">
					<div class="modal-dialog modal-lg">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">Add New Artist</h5>

							</div>
							<%Artist a = (Artist)session.getAttribute("editForm");
								if(a != null){
							%>
							<div class="modal-body">
								<form action="updateArtist" method="post" enctype="multipart/form-data">
									<div class="row mb-3">
										<div class="col-md-6">
											<label for="artistName" class="form-label">Full Name
												<span class="text-danger">*</span>
											</label> <input type="text" class="form-control" id="artistName" name="fullName" value="<%=a.getFullName()%>"
												>
										</div>
										<div class="col-md-6">
											<label for="artistType" class="form-label">Artist
												Type <span class="text-danger">*</span>
											</label> <select class="form-select" id="artistType" name="artistType"  >
												<option value="<%=a.getArtistType()%>" ><%=a.getArtistType()%></option>
												<option value="Actor">Actor</option>
												<option value="Director">Director</option>
												<option value="Producer">Producer</option>
												<option value="Assistant Director">Assistant
													Director</option>
												<option value="DOP">DOP</option>
												<option value="Editor">Editor</option>
												<option value="Colorist">Colorist</option>
												<option value="Art Director">Art Director</option>
												<option value="Make up">Make up</option>
												<option value="Hair Dresser">Hair Dresser</option>
												<option value="Costume">Costume</option>
												<option value="Music Composer">Music Composer</option>
												<option value="Singer">Singer</option>
												<option value="Sound Designer">Sound Designer</option>
												<option value="VFX Artist">VFX Artist</option>
												<option value="Production Department">Production
													Department</option>
												<option value="Light">Light</option>
												<option value="Camera Equipment">Camera Equipment</option>
												<option value="Spot Boys">Spot Boys</option>
												<option value="Distributor">Distributor</option>
												<option value="Other">Other</option>
											</select>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-4">
											<label for="artistAge" class="form-label">Age <span
												class="text-danger">*</span></label> <input type="number"
												class="form-control" id="artistAge" name="age" min="1" max="120" value="<%=a.getAge()%>"
												>
										</div>
										<div class="col-md-4">
											<label for="artistGender" class="form-label">Gender <span
												class="text-danger">*</span></label> <select class="form-select"
												id="artistGender" name="gender" >
												<option value="<%=a.getGender()%>" ><%=a.getGender()%></option>
												<option value="Male">Male</option>
												<option value="Female">Female</option>
												<option value="Trans">Trans</option>
												<option value="All">All</option>
											</select>
										</div>
										
										<div class="col-md-4">
											<label for="artistExperience" class="form-label">Experience
												(years)</label> <input type="number" class="form-control"
												id="artistExperience" name="experience" value="<%=a.getExperience() %>" min="0" max="70">
										</div>
									</div>
									<div class="row mb-3">
									<div class="col-md-4">
											<label for="artistHeight" class="form-label">Height <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="artistHeight" name="height" value="<%=a.getHeight()%>" min="1" max="300"
												>
										</div>
										<div class="col-md-4">
											<label for="artistWeight" class="form-label">Weight <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="artistWeight" name="weight" value="<%=a.getWeight()%>" min="1" max="500"
												>
										</div>
										<div class="col-md-4">
											<label for="artistWeight" class="form-label">Premium Member<span
												class="text-danger">*</span></label> 
												<select class="form-select" id="artistLocation"
												name="permiumMember">
												<option value="<%=a.getPermiumMember() %>"><%=a.getPermiumMember() %></option>
												<option value="Yes">Yes</option>
												<option value="No">No</option>
												</select>
										</div>
									</div>
									<div class="row mb-3">
										<div class="col-md-6">
											<label for="artistLocation" class="form-label">Location
												<span class="text-danger">*</span>
											</label> <select class="form-select" id="artistLocation" name="location" >
												<option value="<%=a.getLocation()%>"><%=a.getLocation()%></option>
												<option value="Pune">Pune</option>
												<option value="Junnar">Junnar</option>
												<option value="Mumbai">Mumbai</option>
												<option value="Nagar">Nagar</option>
												<option value="Nashik">Nashik</option>
												<option value="Nagpur">Nagpur</option>
												<option value="Kolhapur">Kolhapur</option>
												<option value="Solapur">Solapur</option>
												<option value="Kokan">Kokan</option>
												<option value="Satara">Satara</option>
												<option value="Malegaon">Malegaon</option>
												<option value="Marathvada">Marathvada</option>
												<option value="MP">MP</option>
												<option value="UP">UP</option>
												<option value="Gujrat">Gujrat</option>
												<option value="Delhi">Delhi</option>
												<option value="South">South</option>
												<option value="Foreigners">Foreigners</option>
												<option value="Other">Other</option>
											</select>
										</div>
										<div class="col-md-6">
    <label class="form-label">Languages</label>
    <div class="border rounded p-2">
        <%
      
        String[] selectedLanguagesArray = a.getLanguages().split(",");
		List<String> selectedLanguages = Arrays.asList(selectedLanguagesArray);
            String[] languages = {"Marathi", "Hindi", "Tamil", "Telugu", "Kannad", "Malayalam", "Bengali", "Gujrati"};
            for (String lang : languages) {
        %>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="checkbox"
                       id="lang<%=lang%>" name="languages" value="<%=lang%>"
                       <%= selectedLanguages.contains(lang) ? "checked" : "" %>>
                <label class="form-check-label" ><%=lang%></label>
            </div>
        <%
            }
        %>
    </div>
    
</div>
				<div class="col-md-6">
											<label for="artistWeight" class="form-label">Address <span
												class="text-danger">*</span></label> <input type="text"
												class="form-control" id="artistWeight" name="address" value="<%=a.getAddress() %>"
												required>
										</div>
										
										</div>					<div class="row mb-3">
										<div class="col-md-6">
											<label for="artistPhone" class="form-label">Phone
												Number <span class="text-danger">*</span>
											</label> <input type="tel" class="form-control" id="artistPhone" name="phoneNo" value="<%=a.getPhoneNo() %>"
												>
										</div>
										<div class="col-md-6">
											<label for="artistEmail" class="form-label">Email</label> <input
												type="email" class="form-control" id="artistEmail" name="email" value="<%=a.getEmail()%>">
										</div>
									</div>

									<div class="mb-3">
										<label for="artistBio" class="form-label">Biography</label>
										<textarea class="form-control" id="artistBio" name="biography" rows="3"><%=a.getBiography()%></textarea>
									</div>

									<div class="row mb-3">
										<div class="col-md-6">
											<label for="artistProfilePhoto" class="form-label">Profile
												Photo <span class="text-danger">*</span>
											</label> <input class="form-control" type="file"
												 name="profile">
												<img src="images/<%=a.getProfilePhoto()%>" style="height:100px;width:100px">
										</div>
										</div>
										<div class="row mb-3">
										<div class="col-md-6">
											<label for="artistProfilePhoto" class="form-label">More
												Profile Photo <span class="text-danger">*</span>
											</label> <input class="form-control" type="file" id="artistProfilePhoto" name="profile1" multiple>
<div id="fileList" style="display: flex; gap: 10px; flex-wrap: wrap;"></div>
<input type="hidden" name="remainingPhotos" id="remainingPhotos">
<%
    String[] photoArray = a.getMorePhoto() != null ? a.getMorePhoto().split(",") : new String[0];
    Gson gson = new Gson();
    String jsonPhotos = gson.toJson(photoArray);
%>
<script>
  const input = document.getElementById('artistProfilePhoto');
  const fileList = document.getElementById('fileList');
  const remainingPhotosInput = document.getElementById('remainingPhotos');

  let selectedFiles = [];
  let existingImages = [];

  // Load existing images from backend
  const existingPhotos = <%= jsonPhotos %>; // e.g., ["photo1.jpg", "photo2.jpg"]

  existingPhotos.forEach(photo => {
    if (photo.trim()) {
      existingImages.push(photo.trim());
    }
  });

  renderPreviews();

  input.addEventListener('change', () => {
    selectedFiles.push(...input.files);

    // Optional: remove duplicate file names
    selectedFiles = selectedFiles.filter(
      (file, index, self) => index === self.findIndex(f => f.name === file.name)
    );

    renderPreviews();
    updateInputFiles();
  });

  function renderPreviews() {
    fileList.innerHTML = '';

    // Render existing images
    existingImages.forEach((photo, index) => {
      const container = document.createElement('div');
      container.style.position = 'relative';
      container.style.display = 'inline-block';

      const img = document.createElement('img');
      img.src = 'images/' + photo; // adjust path if needed
      img.style.width = '100px';
      img.style.height = '100px';
      img.style.objectFit = 'cover';
      img.style.border = '1px solid #ccc';
      img.style.borderRadius = '4px';

      const delBtn = document.createElement('span');
      delBtn.textContent = 'X';
      delBtn.style.position = 'absolute';
      delBtn.style.top = '0px';
      delBtn.style.right = '0px';
      delBtn.style.cursor = 'pointer';
      delBtn.style.background = 'rgba(255, 255, 255, 0.8)';
      delBtn.style.borderRadius = '50%';
      delBtn.style.padding = '2px 5px';
      delBtn.style.fontSize = '14px';

      delBtn.onclick = () => {
        existingImages.splice(index, 1); // remove from array
        renderPreviews();
      };

      container.appendChild(img);
      container.appendChild(delBtn);
      fileList.appendChild(container);
    });

    // Render new image previews
    selectedFiles.forEach((file, index) => {
      const reader = new FileReader();

      reader.onload = (e) => {
        const container = document.createElement('div');
        container.style.position = 'relative';
        container.style.display = 'inline-block';

        const img = document.createElement('img');
        img.src = e.target.result;
        img.style.width = '100px';
        img.style.height = '100px';
        img.style.objectFit = 'cover';
        img.style.border = '1px solid #ccc';
        img.style.borderRadius = '4px';

        const delBtn = document.createElement('span');
        delBtn.textContent = 'X';
        delBtn.style.position = 'absolute';
        delBtn.style.top = '0px';
        delBtn.style.right = '0px';
        delBtn.style.cursor = 'pointer';
        delBtn.style.background = 'rgba(255, 255, 255, 0.8)';
        delBtn.style.borderRadius = '50%';
        delBtn.style.padding = '2px 5px';
        delBtn.style.fontSize = '14px';

        delBtn.onclick = () => {
          selectedFiles.splice(index, 1);
          renderPreviews();
          updateInputFiles();
        };

        container.appendChild(img);
        container.appendChild(delBtn);
        fileList.appendChild(container);
      };

      reader.readAsDataURL(file);
    });

    // ✅ Update the hidden input with remaining existing image names
    remainingPhotosInput.value = existingImages.join(',');
  }

  function updateInputFiles() {
    const dataTransfer = new DataTransfer();
    selectedFiles.forEach(file => dataTransfer.items.add(file));
    input.files = dataTransfer.files;
  }
</script>


										</div>
										
										</div>
										

									<div class="mb-3">
										<label class="form-label">Social Media Links</label>
										<div class="input-group mb-2">
											<span class="input-group-text"><i
												class="bi bi-instagram"></i></span> <input type="text"
												class="form-control" placeholder="Instagram profile URL" name="instaLink" value="<%=a.getInstaLink()%>">
										</div>
										<div class="input-group mb-2">
											<span class="input-group-text"><i
												class="bi bi-facebook"></i></span> <input type="text"
												class="form-control" placeholder="Facebook profile URL" name="fbLink" value="<%=a.getFbLink()%>">
										</div>
										<%String [] yt=a.getYtLink().split(",");
													for(String ytlink:yt){
													%>
										<div class="input-group mb-2">
											<span class="input-group-text"><i
												class="bi bi-youtube"></i></span> <input type="text"
												class="form-control" placeholder="YouTube channel URL" name="ytLink" value="<%=ytlink%>">
										</div>
										<%} %>
										
									</div>

									<div class="mb-3">
										<div class="form-check">
											<input class="form-check-input" type="checkbox"
												id="featuredArtist"> <label class="form-check-label"
												for="featuredArtist"> Feature this artist on the
												homepage </label>
										</div>
									</div>
							</div>
							
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary"
									data-bs-dismiss="modal">Cancel</button>
								<button type="submit" class="btn btn-purple" name="id" value="<%=a.getId()%>">Update</button>
							</div>
							</form>
							<%} %>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
