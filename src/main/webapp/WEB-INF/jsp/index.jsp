<%@page import="com.example.demo.bean.User"%>
<%@page import="com.example.demo.bean.Artist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Pitaara - Artist Directory</title>
<meta name="description"
	content="Comprehensive directory for artists, musicians, singers and entertainment professionals">
<meta name="author" content="Pitaara">

<meta property="og:title" content="Pitaara - Artist Directory">
<meta property="og:description"
	content="Comprehensive directory for artists, musicians, singers and entertainment professionals">
<meta property="og:type" content="website">
<meta property="og:image"
	content="https://lovable.dev/opengraph-image-p98pqg.png">

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:site" content="@lovable_dev">
<meta name="twitter:image"
	content="https://lovable.dev/opengraph-image-p98pqg.png">

<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Google Fonts - Montserrat -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap">

<!-- Bootstrap Icons -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="css/style.css" type="text/css">

</head>
<body>
	<!-- Header -->
	<header>
		<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
			<div class="container">
				<div class="d-flex align-items-center mx-auto">
					<img src="images/logo.png" style="height: 150px">
				</div>

				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<!-- <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="index.html">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="artists.html">Artists</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="music.html">Music</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.html">About</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.html">Contact</a>
                        </li>
                    </ul>
                    
                    <div class="d-flex align-items-center ms-lg-4">
                        <button class="btn btn-link text-dark p-1 me-2">
                            <i class="bi bi-search"></i>
                        </button>

                        <button class="btn btn-outline-purple d-flex align-items-center">
                            <i class="bi bi-person me-2"></i>
                            <span>Login</span>
                        </button>
                    </div>
                </div> -->
			</div>
		</nav>

		<%User u=(User)session.getAttribute("loginName");
		if(u != null){%>
		<!-- User info - visible on all screen sizes -->
		<div class="container">
			<div class="d-flex justify-content-end py-2">
				<div class="small text-secondary">
					Logged In: <span class="fw-medium"><%=u.getFirstName()%></span>
				</div>
                
			</div>
		</div>
		<%}%>
	</header>

	<!-- Banner / Search Section -->
	<section class="banner-section py-5">
		<div class="container">
			<div class="text-center mb-5">
				<h1 class="display-5 fw-bold mb-3">What are you looking for?</h1>
				<p class="lead text-secondary mx-auto" style="max-width: 600px;">
					Find talented artists, musicians, and entertainment professionals
					with our comprehensive directory</p>
			</div>

			<div class="row justify-content-center">
				<div class="col-12 col-lg-10">
					<form action="searchbar">
						<div class="row g-3">
						
						<div class="col-12 col-md">
								<div class="w-100">
								
								
									<select class="form-select text-start" id="artistDropdown" name="fullName">
    <option value="" disabled selected>Artist Name</option>
    <%
        List<Artist> list1 = (List<Artist>) session.getAttribute("show1");
        if (list1 != null && !list1.isEmpty()) {
            for (Artist a : list1) {
    %>
                <option value="<%= a.getFullName() %>"><%= a.getFullName() %></option>
    <%
            }
        }
    %>
</select>

								</div>
							</div>
							<div class="col-12 col-md">
								<div class="w-100">
								
								
									<select class="form-select text-start" id="artistDropdown"
										name="artistType">
										<option value="" disabled selected>Artist Type</option>
										<option value="Actor">Actor</option>
										<option value="Director">Director</option>
										<option value="Producer">Producer</option>
										<option value="Assistant Director">Assistant Director</option>
										<option value="DOP">DOP</option>
										<option value="Editor">Editor</option>
										<option value="Colorist">Colorist</option>
										<option value="Art Director">Art Director</option>
										<option value="Make up">Make up</option>
										<option value="Hair dresser">Hair dresser</option>
										<option value="Costume Designer">Costume Designer</option>
										<option value="Singer">Singer</option>
										<option value="Sound Designer">Sound Designer</option>
										<option value="VFX Artist">VFX Artist</option>
										<option value="Production Dept">Production Dept</option>
										<option value="Light">Light</option>
										<option value="Camera Equipments">Camera Equipments</option>
										<option value="Spot Boys">Spot Boys</option>
										<option value="Distributor">Distributor</option>
									</select>
								</div>
							</div>

							<div class="col-12 col-md">
								<div class="w-100">
									<select class="form-select text-start" id="locationDropdown"
										name="location">
										<option value="" disabled selected>Location</option>
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
										<option value="Marathwada">Marathwada</option>
										<option value="MP">MP</option>
										<option value="UP">UP</option>
										<option value="Gujrat">Gujrat</option>
										<option value="Delhi">Delhi</option>
										<option value="South">South</option>
										<option value="Foreigners">Foreigners</option>
									</select>
								</div>
							</div>

							<div class="col-12 col-md">
								<div class="w-100">
									<select class="form-select dropdown-toggle text-start"
										id="genderDropdown" name="gender">
										<option value="" disabled selected>Gender</option>
										<option value="Male">Male</option>
										<option value="Female">Female</option>
										<option value="Trans">Trans</option>
										<option value="All">All</option>
									</select>
								</div>
							</div>

							<div class="col-12 col-md">
								<div class="w-100">
									<select class="form-select text-start" id="languageDropdown"
										name="languages">
										<option value="" disabled selected>Language</option>
										<option value="Marathi">Marathi</option>
										<option value="Hindi">Hindi</option>
										<option value="Tamil">Tamil</option>
										<option value="Telugu">Telugu</option>
										<option value="Kannad">Kannad</option>
										<option value="Malayalam">Malayalam</option>
										<option value="Bengali">Bengali</option>
										<option value="Gujrati">Gujrati</option>
									</select>
								</div>
							</div>


							<div class="col-12 col-md-auto">
								<button
									class="btn btn-purple w-100 d-flex align-items-center justify-content-center">
									<i class="bi bi-search me-2"></i> <span>Search</span>
								</button>
							</div>
						</div>
					</form>
				</div>
				
			</div>
			<div class="col-2 " style="margin: auto;
    margin-top: 3%;">
								<a href="premiumMember"
									class="btn btn-purple w-100 d-flex align-items-center justify-content-center">
									 <span>Premium Member</span>
								</a>

								<a href="addArtist"
									class="btn btn-purple w-100 d-flex align-items-center justify-content-center">
									 <span>Add Artist</span>
								</a>
							</div>
			
		</div>
	</section>

	<!-- Artist Section -->
	<section class="py-5 bg-light">
		<div class="container">
			<div class="d-flex justify-content-between align-items-center mb-4">
				<%
				if (session.getAttribute("no") != null) {

					int no = (Integer) session.getAttribute("no");
					if (no < 0) {
				%>
				<h2 class="display-6 fw-bold">Search Results (0)</h2>
				<%
				} else {
				%>
				<h2 class="display-6 fw-bold">
					Search Results (<%=no%>)
				</h2>
				<%
				}
				} else {
				%>
				<h2 class="display-6 fw-bold">Search Results (0)</h2>

				<%
				}
				session.removeAttribute("no");
				%>
			</div>

			<div class="row g-4">
				<!-- Artist Card 1 -->

				<%
				List<Artist> list = (List<Artist>) session.getAttribute("searchlist");
				%>
				<%
				if (list != null) {
					for (Artist a : list) {
				%>
				<div class="col-12 col-md-6 col-lg-4" contenteditable="false"
					tabindex="-1">
					<div class="card border h-100 shadow-sm hover-shadow">
						<div class="card-body">
							<h3 class="fw-semibold mb-3"><%=a.getFullName()%></h3>


							<div class="row g-3 mb-3">
								<div class="col-12">
									<!-- Carousel for Profile and Work Photos -->
									<div id="profileCarousel_<%=a.getId()%>" class="carousel slide"
										data-bs-ride="carousel">
										<div class="carousel-inner">
											<!-- Profile Photo -->
											<div class="carousel-item active">
												<div class="border border-purple rounded overflow-hidden">
													<img src="images/<%=a.getProfilePhoto()%>"
														alt="Rahul Sharma profile" class="img-fluid fixed-img"
														style="height: 300px; width: 100%; cursor: pointer"
														onclick="openImageModal(this)">

												</div>

											</div>

											<!-- Work Sample 1 -->

											<%
											String arr[] = a.getMorePhoto().split(",");
											for (String photo : arr) {
											%>

											<!-- Work Sample 2 -->
											<div class="carousel-item">
												<div class="border rounded overflow-hidden">
													<img src="images/<%=photo%>"
														alt="Rahul Sharma work sample 2"
														class="img-fluid fixed-img"
														style="height: 300px; width: 100%">
												</div>

											</div>
											<%
											}
											%>

											<!-- Work Sample 3 -->

											<!-- Work Sample 4 -->

										</div>

										<!-- Controls -->
										<button class="carousel-control-prev" type="button"
											data-bs-target="#profileCarousel_<%=a.getId()%>"
											data-bs-slide="prev">
											<span class="carousel-control-prev-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Previous</span>
										</button>
										<button class="carousel-control-next" type="button"
											data-bs-target="#profileCarousel_<%=a.getId()%>"
											data-bs-slide="next">
											<span class="carousel-control-next-icon" aria-hidden="true"></span>
											<span class="visually-hidden">Next</span>
										</button>
									</div>
								</div>
							</div>


							<div class="mb-3">
								<p class="mb-1 small">
									<span class="fw-medium">Artist Type:</span>
									<%=a.getArtistType()%></p>
								<p class="mb-1 small">
									<span class="fw-medium">Age:</span><%=a.getAge()%></p>
								<p class="mb-1 small">
									<span class="fw-medium">Gender:</span><%=a.getGender()%></p>
								<p class="mb-1 small">
									<span class="fw-medium">Address:</span><%=a.getAddress()%></p>
								<p class="mb-1 small">
									<span class="fw-medium">Language:</span><%=a.getLanguages()%></p>
								<p class="mb-1 small">
									<span class="fw-medium">Contact:</span>+91<%=a.getPhoneNo()%></p>
							</div>

							<div class="d-flex justify-content-between">
								<form action="singleProfile" method="post">
									<input type="hidden" value="<%=a.getId()%>" name="id">

									<!-- Button with conditional data-bs-target attribute -->
									<button class="btn btn-purple" type="submit">View
										Profile</button>
								</form>




								<a href="https://wa.me/<%=a.getPhoneNo()%>
								"
									class="btn d-flex align-items-center"
									style="border: 1px solid #075E54;"> <img
									src="images/whatapp.jpeg" style="height: 25px"> <span>Whatsapp
								</span>
								</a>
							</div>


						</div>
					</div>
				</div>
				<%
				}
				}
				session.removeAttribute("searchlist");
				%>


				<!-- Image Preview Modal -->
				<div class="modal fade" id="imageModal" tabindex="-1"
					aria-labelledby="imageModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-lg modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-body p-0">
								<img id="modalImage" src="" class="img-fluid w-100"
									alt="Preview">
							</div>
						</div>
					</div>
				</div>

				<!-- Footer -->
				<footer class="bg-dark text-white pt-2 pb-3">
					<div class="container">
						<!-- <div class="row g-4">
                <div class="col-lg-3 col-md-6">
                    <h3 class="fs-3 fw-bold text-peach mb-3">Pitaara</h3>
                    <p class="text-white-50 mb-3">
                        Your comprehensive platform for discovering artists, musicians, singers, and entertainment professionals.
                    </p>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-white">
                            <i class="bi bi-facebook"></i>
                        </a>
                        <a href="#" class="text-white">
                            <i class="bi bi-twitter"></i>
                        </a>
                        <a href="#" class="text-white">
                            <i class="bi bi-instagram"></i>
                        </a>
                        <a href="#" class="text-white">
                            <i class="bi bi-youtube"></i>
                        </a>
                    </div>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <h4 class="fs-5 fw-semibold text-peach mb-3">Quick Links</h4>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="index.html" class="text-decoration-none text-white-50 hover-peach">Home</a>
                        </li>
                        <li class="mb-2">
                            <a href="artists.html" class="text-decoration-none text-white-50 hover-peach">Artists</a>
                        </li>
                        <li class="mb-2">
                            <a href="music.html" class="text-decoration-none text-white-50 hover-peach">Music</a>
                        </li>
                        <li class="mb-2">
                            <a href="about.html" class="text-decoration-none text-white-50 hover-peach">About Us</a>
                        </li>
                        <li class="mb-2">
                            <a href="contact.html" class="text-decoration-none text-white-50 hover-peach">Contact</a>
                        </li>
                    </ul>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <h4 class="fs-5 fw-semibold text-peach mb-3">Artist Categories</h4>
                    <ul class="list-unstyled">
                        <li class="mb-2">
                            <a href="#" class="text-decoration-none text-white-50 hover-peach">Actors</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-decoration-none text-white-50 hover-peach">Musicians</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-decoration-none text-white-50 hover-peach">Singers</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-decoration-none text-white-50 hover-peach">Directors</a>
                        </li>
                        <li class="mb-2">
                            <a href="#" class="text-decoration-none text-white-50 hover-peach">Producers</a>
                        </li>
                    </ul>
                </div>
                
                <div class="col-lg-3 col-md-6">
                    <h4 class="fs-5 fw-semibold text-peach mb-3">Contact Info</h4>
                    <ul class="list-unstyled">
                        <li class="mb-2 d-flex align-items-center">
                            <i class="bi bi-envelope text-peach me-2"></i>
                            <a href="mailto:info@pitaara.com" class="text-decoration-none text-white-50 hover-peach">info@pitaara.com</a>
                        </li>
                        <li class="mb-2 d-flex align-items-center">
                            <i class="bi bi-telephone text-peach me-2"></i>
                            <a href="tel:+1234567890" class="text-decoration-none text-white-50 hover-peach">+123 456 7890</a>
                        </li>
                    </ul>
                    
                    <div class="mt-3">
                        <h5 class="fs-6 fw-semibold text-peach mb-2">Subscribe to Newsletter</h5>
                        <div class="input-group">
                            <input type="email" class="form-control bg-dark text-white border-secondary" placeholder="Your email">
                            <button class="btn btn-purple">Send</button>
                        </div>
                    </div>
                </div>
            </div> -->

						<hr class="mt-4 mb-3 border-secondary">

						<div class="row">
							<div class="col-md-6 text-center text-md-start">
								<p class="text-white-50 small mb-md-0">
									&copy; <span id="current-year">© Pitaara 2025 | Made with
 Do IT Infosystems
									
								</p>
							</div>
							<div class="col-md-6 text-center text-md-end">
								<ul class="list-inline mb-0">
									<li class="list-inline-item"><a href="#"
										class="text-decoration-none text-white-50 small hover-peach">Privacy
											Policy</a></li>
									<li class="list-inline-item ms-3"><a href="#"
										class="text-decoration-none text-white-50 small hover-peach">Terms
											of Service</a></li>
									<li class="list-inline-item ms-3"><a href="#"
										class="text-decoration-none text-white-50 small hover-peach">Cookie
											Policy</a></li>
								</ul>
							</div>
						</div>
					</div>
				</footer>


				<%
				Artist a = (Artist) session.getAttribute("singleProfile");
				if (a != null) {
				%>
				<script>
					window.addEventListener("load", function() {
						var myModal = new bootstrap.Modal(document
								.getElementById('profileModal'));
						myModal.show();
					});
				</script>

				<div class="modal fade" id="profileModal" tabindex="-1"
					aria-labelledby="profileModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-dialog-centered modal-xl">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="profileModalLabel"><%=a.getFullName()%>
									- Profile
								</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>

							<div class="modal-body">
								<ul class="nav nav-tabs mb-4" id="profileTab" role="tablist">
									<li class="nav-item" role="presentation">
										<button class="nav-link active" id="info-tab"
											data-bs-toggle="tab" data-bs-target="#info-tab-pane"
											type="button" role="tab" aria-controls="info-tab-pane"
											aria-selected="true">Information</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="portfolio-tab"
											data-bs-toggle="tab" data-bs-target="#portfolio-tab-pane"
											type="button" role="tab" aria-controls="portfolio-tab-pane"
											aria-selected="false">Portfolio</button>
									</li>
									<li class="nav-item" role="presentation">
										<button class="nav-link" id="contact-tab" data-bs-toggle="tab"
											data-bs-target="#contact-tab-pane" type="button" role="tab"
											aria-controls="contact-tab-pane" aria-selected="false">Contact</button>
									</li>
								</ul>

								<div class="tab-content" id="profileTabContent">
									<!-- Info Tab -->
									<div class="tab-pane fade show active" id="info-tab-pane"
										role="tabpanel" aria-labelledby="info-tab" tabindex="0">
										<div class="row">
											<div class="col-md-4 mb-4 mb-md-0">
												<div class="border rounded overflow-hidden">
													<img src="images/<%=a.getProfilePhoto()%>"
														alt="Rahul Sharma profile" class="img-fluid">
												</div>
											</div>

											<div class="col-md-8">
												<h3 class="fw-bold mb-3"><%=a.getFullName()%></h3>

												<div class="mb-4">
													<p class="mb-2">
														<span class="fw-medium">Artist Type:</span>
														<%=a.getArtistType()%></p>
													<p class="mb-2">
														<span class="fw-medium">Age:</span>
														<%=a.getAge()%></p>
													<p class="mb-2">
														<span class="fw-medium">Gender:</span>
														<%=a.getGender()%></p>
													<p class="mb-2">
														<span class="fw-medium">Address:</span>
														<%=a.getAddress()%></p>
													<p class="mb-2">
														<span class="fw-medium">Language:</span>
														<%=a.getLanguages()%></p>
													<p class="mb-2">
														<span class="fw-medium">Contact:</span> +91<%=a.getPhoneNo()%></p>
												</div>

												<div class="mb-4">
													<h4 class="fw-medium mb-2">Bio:</h4>
													<p class="text-muted">
														<%=a.getBiography()%>
													</p>
												</div>

												<div>
													<h4 class="fw-medium mb-2">Skills:</h4>
													<div class="d-flex flex-wrap gap-2">
														<span
															class="badge rounded-pill bg-purple-light text-purple">Acting</span>
														<span
															class="badge rounded-pill bg-purple-light text-purple">Dancing</span>
														<span
															class="badge rounded-pill bg-purple-light text-purple">Singing</span>
														<span
															class="badge rounded-pill bg-purple-light text-purple">Direction</span>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- Portfolio Tab -->
									<div class="tab-pane fade" id="portfolio-tab-pane"
										role="tabpanel" aria-labelledby="portfolio-tab" tabindex="0">
										<h4 class="fw-medium mb-3">Work Samples</h4>
					
										<div class="row g-3 mb-4">
											<%
											String arr[] = a.getMorePhoto().split(",");
											for (String photo : arr) {
											%>
											<div class="col-6 col-md-3">
												<div class="border rounded overflow-hidden img-box">
													<img src="images/<%=photo%>"
														alt="Rahul Sharma work sample 1"
														class="img-fluid full-fit-img">
												</div>
											</div>
											<%
											}
											%>
										</div>

										<style>
											.img-box {
												width: 100%;
												height: 200px; /* Fixed height for uniformity */
												display: flex;
												align-items: center;
												justify-content: center;
												background-color: #f8f9fa; /* optional: helps fill gaps */
											}
											
											.full-fit-img {
												max-width: 100%;
												max-height: 100%;
												object-fit: contain;
											}
											</style>
											
										<h4 class="fw-medium mb-3">Videos</h4>
										<div class="row g-3 mb-4">
											<%
											String yt[] = a.getYtLink().split(",");
											for (String link : yt) {
											%>
											<div class="col-md-4 mb-3">
												<div
													class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
													<a href="<%=link%>">
														<div
															class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
															<i class="bi bi-play-circle fs-1"></i>
														</div>
													</a>
												</div>
											</div>
											<%
											}
											%>

										</div>



									</div>

									<!-- Contact Tab -->
									<div class="tab-pane fade" id="contact-tab-pane"
										role="tabpanel" aria-labelledby="contact-tab" tabindex="0">
										<div class="row justify-content-center">
											<div class="col-lg-8">
												<div class="mb-4 p-3 bg-light rounded">
													<h4 class="fw-medium mb-2">Contact Details:</h4>
													<p class="mb-1">
														<span class="fw-medium">Email:</span>
														<%=a.getEmail()%></p>
													<p class="mb-1">
														<span class="fw-medium">Phone:</span> +91
														<%=a.getPhoneNo()%></p>
													<p class="mb-1">
														<span class="fw-medium">Address:</span>
														<%=a.getAddress()%></p>
												</div>

												<div class="mb-4 p-3 bg-light rounded">
													<h4 class="fw-medium mb-2">Social Media:</h4>
													<p class="mb-1">
														<span class="fw-medium">Facebook:</span> <a
															href="<%=a.getFbLink()%>"><%=a.getFbLink()%></a>
													</p>
													<p class="mb-1">
														<span class="fw-medium">Instagram:</span> <a
															href="<%=a.getInstaLink()%>"> <%=a.getInstaLink()%></a>
													</p>

												</div>



												<div class="d-flex justify-content-center gap-3">
													<a href="generate-pdf?id=<%=a.getId()%>"
														class="btn btn-warning"> Generate PDF </a>

												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<%
				// Clear the session attribute so it doesn't open again on refresh
				session.removeAttribute("singleProfile");
				}
				%>

				<!-- Portfolio Tab -->
				<div class="tab-pane fade" id="portfolio-tab-pane" role="tabpanel"
					aria-labelledby="portfolio-tab" tabindex="0">
					<h4 class="fw-medium mb-3">Work Samples</h4>
					<div class="row g-3 mb-4">
						<div class="col-6 col-md-3">
							<div class="border rounded overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1611516491426-03025e6043c8?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YWN0b3J8ZW58MHx8MHx8fDA%3D"
									alt="Rahul Sharma work sample 1" class="img-fluid">
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="border rounded overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1619389136796-ebf6a39d507c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGFjdG9yfGVufDB8fDB8fHww"
									alt="Rahul Sharma work sample 2" class="img-fluid">
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="border rounded overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1594463750939-ebb28c3f7f75?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGFjdG9yfGVufDB8fDB8fHww"
									alt="Rahul Sharma work sample 3" class="img-fluid">
							</div>
						</div>
						<div class="col-6 col-md-3">
							<div class="border rounded overflow-hidden">
								<img
									src="https://images.unsplash.com/photo-1626125345510-4603468eedfb?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8YWN0b3J8ZW58MHx8MHx8fDA%3D"
									alt="Rahul Sharma work sample 4" class="img-fluid">
							</div>
						</div>
					</div>

					<h4 class="fw-medium mb-3">Videos</h4>
					<div class="row g-3 mb-4">
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
					</div>
					<div class="row g-3 mb-4">
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
						<div class="col-md-4 mb-3">
							<div
								class="bg-danger rounded overflow-hidden position-relative ratio ratio-16x9">
								<div
									class="position-absolute top-0 start-0 w-100 h-100 d-flex align-items-center justify-content-center text-white">
									<i class="bi bi-play-circle fs-1"></i>
								</div>
							</div>
						</div>
					</div>


				</div>

				<!-- Contact Tab -->
				<div class="tab-pane fade" id="contact-tab-pane" role="tabpanel"
					aria-labelledby="contact-tab" tabindex="0">
					<div class="row justify-content-center">
						<div class="col-lg-8">
							<div class="mb-4 p-3 bg-light rounded">
								<h4 class="fw-medium mb-2">Contact Details:</h4>
								<p class="mb-1">
									<span class="fw-medium">Email:</span> rahul.sharma@example.com
								</p>
								<p class="mb-1">
									<span class="fw-medium">Phone:</span> +91 98765 43210
								</p>
								<p class="mb-1">
									<span class="fw-medium">Address:</span> 123 Artist Lane, Mumbai
								</p>
							</div>

							<div class="mb-4 p-3 bg-light rounded">
								<h4 class="fw-medium mb-2">Social Media:</h4>
								<p class="mb-1">
									<span class="fw-medium">Facebook:</span>
									facebook.com/rahulsharma
								</p>
								<p class="mb-1">
									<span class="fw-medium">Instagram:</span>
									instagram.com/rahulsharma
								</p>
								<p class="mb-1">
									<span class="fw-medium">Twitter:</span> twitter.com/rahulsharma
								</p>
							</div>



							<div class="d-flex justify-content-center gap-3">
								<button class="btn btn-warning">Generate PDF</button>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		</div>

		<!-- Bootstrap JS Bundle with Popper -->
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

		<!-- Custom JS -->
		<script>
			function openImageModal(imgElement) {
				const modalImage = document.getElementById("modalImage");
				modalImage.src = imgElement.src;
				const imageModal = new bootstrap.Modal(document
						.getElementById('imageModal'));
				imageModal.show();
			}
		</script>

		<script src="script.js"></script>
</body>
</html>

