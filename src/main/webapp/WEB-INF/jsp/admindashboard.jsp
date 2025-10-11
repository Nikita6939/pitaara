<%@page import="com.example.demo.bean.Artist"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pitaara Admin Panel</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <!-- Custom CSS -->
    <!-- <link rel="stylesheet" href="../styles.css"> -->
    <link rel="stylesheet" href="css/styles.css" type= "text/css">
    <!-- Google Fonts (Montserrat) -->
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            
      
            
            <jsp:include page="sidebar.jsp"></jsp:include>
            
            <!-- Main Content -->
            <div class="col-md-9 col-lg-10 ms-sm-auto px-md-4 py-4">
                <!-- Top Navigation -->
                
                
                <!-- Tab Content -->
                <div class="tab-content">
                    <!-- Dashboard Tab -->
                   
                    
                    <!-- Artists Tab -->
                    <div class="tab-pane fade show active" id="artists">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Manage Artists</h5>
                                        <a href="addArtist" class="btn btn-purple" >
                                            <i class="bi bi-plus-circle me-2"></i>Add New Artist
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <!-- Search and Filter -->
                                       
                                        
                                        <%List<Artist> list=(List<Artist>)session.getAttribute("show");%>
                                        <!-- Artists Table -->
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                       
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Type</th>
                                                        <th scope="col">Age</th>
                                                        <th scope="col">Gender</th>
                                                        <th scope="col">Location</th>
                                                        <th scope="col">Languages</th>
														 <th scope="col">Reference</th>
                                                        <th scope="col">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                 <%if(list != null){
                                                 for(Artist li:list){%>
													<tr>
														
														<td>
															<div class="d-flex align-items-center">
																<img src="<%=li.getProfilePhoto()%>" alt="Artist"
																	class="rounded-circle me-2" width="40" height="40">
																<div>
																	<div class="fw-bold"><%=li.getFullName()%></div>
																</div>
															</div>
														</td>
														<td><%=li.getArtistType()%></td>
														<td><%=li.getAge()%></td>
														<td><%=li.getGender()%></td>
														<td><%=li.getLocation()%></td>
														<td><%=li.getLanguages()%></td>
														<td><%=li.getReference()%></td>
														<td>
															<div class="btn-group">
																<form action="editArtist" >
																	<button class="btn btn-sm" style="color:#3f2b97;border-color:#3f2b97"
																		name="id" value="<%=li.getId()%>">
																		<i class="bi bi-pencil"></i>
																	</button>
																</form>
																<form action="deleteArtist">
																	<button class="btn btn-sm btn-outline-danger" name="id"
																		value="<%=li.getId()%>">
																		<i class="bi bi-trash"></i>
																	</button>
																</form>
																
															</div>
														</td>
													</tr>
													<%}}%>
                                                </tbody>
                                            </table>
                                        </div>
                                        
                                        <!-- Pagination -->
                                       
                                    </div>
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        
                                        <a href="export-excel" class="btn btn-purple" >
                                            <i class="bi bi-plus-circle me-2"></i>Export into Excel
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Musicians Tab -->
                    <div class="tab-pane fade" id="musicians">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Manage Musicians</h5>
                                        <button class="btn btn-purple" data-bs-toggle="modal" data-bs-target="#addMusicianModal">
                                            <i class="bi bi-plus-circle me-2"></i>Add New Musician
                                        </button>
                                    </div>
                                    <div class="card-body">
                                        <!-- Search and Filter -->
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search musicians...">
                                                    <button class="btn btn-outline-secondary" type="button">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6 d-flex gap-2 justify-content-md-end">
                                                <select class="form-select w-auto">
                                                    <option selected>All Instruments</option>
                                                    <option>Guitar</option>
                                                    <option>Piano</option>
                                                    <option>Drums</option>
                                                    <option>Violin</option>
                                                </select>
                                                <select class="form-select w-auto">
                                                    <option selected>All Genres</option>
                                                    <option>Classical</option>
                                                    <option>Rock</option>
                                                    <option>Jazz</option>
                                                    <option>Pop</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <!-- Musicians Table -->
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="selectAllMusicians">
                                                                <label class="form-check-label" for="selectAllMusicians"></label>
                                                            </div>
                                                        </th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Instrument</th>
                                                        <th scope="col">Genre</th>
                                                        <th scope="col">Experience</th>
                                                        <th scope="col">Location</th>
                                                        <th scope="col">Albums</th>
                                                        <th scope="col">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://randomuser.me/api/portraits/men/41.jpg" alt="Musician" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Aditya Kapoor</div>
                                                                    <div class="small text-muted">ID: MUS001</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Guitar</td>
                                                        <td>Rock</td>
                                                        <td>10 years</td>
                                                        <td>Mumbai</td>
                                                        <td>4</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://randomuser.me/api/portraits/women/24.jpg" alt="Musician" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Meera Desai</div>
                                                                    <div class="small text-muted">ID: MUS002</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Violin</td>
                                                        <td>Classical</td>
                                                        <td>15 years</td>
                                                        <td>Chennai</td>
                                                        <td>6</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        
                                        <!-- Pagination -->
                                        <nav class="d-flex justify-content-between align-items-center mt-4">
                                            <div>Showing 1 to 2 of 124 entries</div>
                                            <ul class="pagination mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Directors Tab -->
                    <div class="tab-pane fade" id="directors">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Manage Directors</h5>
                                        <button class="btn btn-purple" data-bs-toggle="modal" data-bs-target="#addDirectorModal">
                                            <i class="bi bi-plus-circle me-2"></i>Add New Director
                                        </button>
                                    </div>
                                    <div class="card-body">
                                        <!-- Search and Filter -->
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search directors...">
                                                    <button class="btn btn-outline-secondary" type="button">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6 d-flex gap-2 justify-content-md-end">
                                                <select class="form-select w-auto">
                                                    <option selected>All Genres</option>
                                                    <option>Feature Films</option>
                                                    <option>Documentaries</option>
                                                    <option>Short Films</option>
                                                    <option>Music Videos</option>
                                                </select>
                                                <select class="form-select w-auto">
                                                    <option selected>All Locations</option>
                                                    <option>Mumbai</option>
                                                    <option>Delhi</option>
                                                    <option>Bangalore</option>
                                                    <option>Chennai</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <!-- Directors Table -->
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="selectAllDirectors">
                                                            </div>
                                                        </th>
                                                        <th scope="col">Name</th>
                                                        <th scope="col">Specialization</th>
                                                        <th scope="col">Experience</th>
                                                        <th scope="col">Projects</th>
                                                        <th scope="col">Location</th>
                                                        <th scope="col">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://randomuser.me/api/portraits/men/54.jpg" alt="Director" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Amitabh Verma</div>
                                                                    <div class="small text-muted">ID: DIR001</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Feature Films</td>
                                                        <td>20 years</td>
                                                        <td>12 films</td>
                                                        <td>Mumbai</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary" style="color:#3f2b97;border-color:#3f2b97">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://randomuser.me/api/portraits/women/67.jpg" alt="Director" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Deepa Menon</div>
                                                                    <div class="small text-muted">ID: DIR002</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Documentaries</td>
                                                        <td>15 years</td>
                                                        <td>8 films</td>
                                                        <td>Delhi</td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        
                                        <!-- Pagination -->
                                        <nav class="d-flex justify-content-between align-items-center mt-4">
                                            <div>Showing 1 to 2 of 76 entries</div>
                                            <ul class="pagination mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Locations Tab -->
                    <div class="tab-pane fade" id="locations">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Manage Locations</h5>
                                        <button class="btn btn-purple" data-bs-toggle="modal" data-bs-target="#addLocationModal">
                                            <i class="bi bi-plus-circle me-2"></i>Add New Location
                                        </button>
                                    </div>
                                    <div class="card-body">
                                        <!-- Search and Filter -->
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search locations...">
                                                    <button class="btn btn-outline-secondary" type="button">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6 d-flex gap-2 justify-content-md-end">
                                                <select class="form-select w-auto">
                                                    <option selected>All States</option>
                                                    <option>Maharashtra</option>
                                                    <option>Delhi</option>
                                                    <option>Karnataka</option>
                                                    <option>Tamil Nadu</option>
                                                </select>
                                                <select class="form-select w-auto">
                                                    <option selected>All Categories</option>
                                                    <option>Film Studios</option>
                                                    <option>Performance Venues</option>
                                                    <option>Recording Studios</option>
                                                    <option>Art Galleries</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <!-- Locations Table -->
                                        <div class="table-responsive">
                                            <table class="table table-hover align-middle">
                                                <thead class="table-light">
                                                    <tr>
                                                        <th scope="col">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox" id="selectAllLocations">
                                                            </div>
                                                        </th>
                                                        <th scope="col">Location Name</th>
                                                        <th scope="col">Category</th>
                                                        <th scope="col">City</th>
                                                        <th scope="col">State</th>
                                                        <th scope="col">Capacity</th>
                                                        <th scope="col">Status</th>
                                                        <th scope="col">Actions</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://via.placeholder.com/40x40" alt="Location" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Film City</div>
                                                                    <div class="small text-muted">ID: LOC001</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Film Studio</td>
                                                        <td>Mumbai</td>
                                                        <td>Maharashtra</td>
                                                        <td>Large</td>
                                                        <td><span class="badge bg-success">Active</span></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex align-items-center">
                                                                <img src="https://via.placeholder.com/40x40" alt="Location" class="rounded-circle me-2" width="40" height="40">
                                                                <div>
                                                                    <div class="fw-bold">Melody Music Studio</div>
                                                                    <div class="small text-muted">ID: LOC002</div>
                                                                </div>
                                                            </div>
                                                        </td>
                                                        <td>Recording Studio</td>
                                                        <td>Chennai</td>
                                                        <td>Tamil Nadu</td>
                                                        <td>Medium</td>
                                                        <td><span class="badge bg-success">Active</span></td>
                                                        <td>
                                                            <div class="btn-group">
                                                                <button class="btn btn-sm btn-outline-primary">
                                                                    <i class="bi bi-pencil"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-danger">
                                                                    <i class="bi bi-trash"></i>
                                                                </button>
                                                                <button class="btn btn-sm btn-outline-secondary">
                                                                    <i class="bi bi-three-dots-vertical"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        
                                        <!-- Pagination -->
                                        <nav class="d-flex justify-content-between align-items-center mt-4">
                                            <div>Showing 1 to 2 of 42 entries</div>
                                            <ul class="pagination mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Media Tab -->
                    <div class="tab-pane fade" id="media">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Media Library</h5>
                                        <button class="btn btn-purple" data-bs-toggle="modal" data-bs-target="#uploadMediaModal">
                                            <i class="bi bi-cloud-upload me-2"></i>Upload Media
                                        </button>
                                    </div>
                                    <div class="card-body">
                                        <!-- Search and Filter -->
                                        <div class="row mb-4">
                                            <div class="col-md-6 mb-3 mb-md-0">
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Search media...">
                                                    <button class="btn btn-outline-secondary" type="button">
                                                        <i class="bi bi-search"></i>
                                                    </button>
                                                </div>
                                            </div>
                                            <div class="col-md-6 d-flex gap-2 justify-content-md-end">
                                                <select class="form-select w-auto">
                                                    <option selected>All Media Types</option>
                                                    <option>Images</option>
                                                    <option>Audio</option>
                                                    <option>Video</option>
                                                    <option>Documents</option>
                                                </select>
                                                <button class="btn btn-outline-secondary">
                                                    <i class="bi bi-grid me-2"></i>Grid
                                                </button>
                                                <button class="btn btn-outline-secondary">
                                                    <i class="bi bi-list me-2"></i>List
                                                </button>
                                            </div>
                                        </div>
                                        
                                        <!-- Media Grid -->
                                        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 g-4">
                                            <!-- Image 1 -->
                                            <div class="col">
                                                <div class="card h-100 border-0 shadow-sm hover-shadow">
                                                    <div class="position-relative">
                                                        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Media">
                                                        <div class="position-absolute top-0 end-0 p-2">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <h6 class="card-title">Artist Profile Photo</h6>
                                                        <p class="card-text small text-muted">
                                                            <i class="bi bi-image me-1"></i> Image
                                                            <span class="ms-2">2.4 MB</span>
                                                            <span class="ms-2">Aug 15, 2023</span>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <div class="btn-group w-100">
                                                            <button class="btn btn-sm btn-outline-secondary">
                                                                <i class="bi bi-download"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-danger">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-primary">
                                                                <i class="bi bi-pencil"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Audio 1 -->
                                            <div class="col">
                                                <div class="card h-100 border-0 shadow-sm hover-shadow">
                                                    <div class="position-relative bg-purple-light p-4 text-center">
                                                        <i class="bi bi-music-note-beamed fs-1 text-purple"></i>
                                                        <div class="position-absolute top-0 end-0 p-2">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <h6 class="card-title">Sample Track 1</h6>
                                                        <p class="card-text small text-muted">
                                                            <i class="bi bi-file-earmark-music me-1"></i> Audio
                                                            <span class="ms-2">5.6 MB</span>
                                                            <span class="ms-2">Aug 10, 2023</span>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <div class="btn-group w-100">
                                                            <button class="btn btn-sm btn-outline-secondary">
                                                                <i class="bi bi-download"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-danger">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-primary">
                                                                <i class="bi bi-pencil"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Video 1 -->
                                            <div class="col">
                                                <div class="card h-100 border-0 shadow-sm hover-shadow">
                                                    <div class="position-relative">
                                                        <img src="https://via.placeholder.com/300x200" class="card-img-top" alt="Video Thumbnail">
                                                        <div class="position-absolute top-50 start-50 translate-middle">
                                                            <i class="bi bi-play-circle-fill fs-1 text-white"></i>
                                                        </div>
                                                        <div class="position-absolute top-0 end-0 p-2">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <h6 class="card-title">Director Showreel</h6>
                                                        <p class="card-text small text-muted">
                                                            <i class="bi bi-camera-video me-1"></i> Video
                                                            <span class="ms-2">24.5 MB</span>
                                                            <span class="ms-2">Aug 5, 2023</span>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <div class="btn-group w-100">
                                                            <button class="btn btn-sm btn-outline-secondary">
                                                                <i class="bi bi-download"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-danger">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-primary">
                                                                <i class="bi bi-pencil"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            
                                            <!-- Document 1 -->
                                            <div class="col">
                                                <div class="card h-100 border-0 shadow-sm hover-shadow">
                                                    <div class="position-relative bg-peach-light p-4 text-center">
                                                        <i class="bi bi-file-earmark-text fs-1 text-peach"></i>
                                                        <div class="position-absolute top-0 end-0 p-2">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="checkbox">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <h6 class="card-title">Contract Template</h6>
                                                        <p class="card-text small text-muted">
                                                            <i class="bi bi-file-earmark-pdf me-1"></i> PDF
                                                            <span class="ms-2">1.2 MB</span>
                                                            <span class="ms-2">Jul 28, 2023</span>
                                                        </p>
                                                    </div>
                                                    <div class="card-footer bg-white border-top-0">
                                                        <div class="btn-group w-100">
                                                            <button class="btn btn-sm btn-outline-secondary">
                                                                <i class="bi bi-download"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-danger">
                                                                <i class="bi bi-trash"></i>
                                                            </button>
                                                            <button class="btn btn-sm btn-outline-primary">
                                                                <i class="bi bi-pencil"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <!-- Pagination -->
                                        <nav class="d-flex justify-content-between align-items-center mt-4">
                                            <div>Showing 1 to 4 of 120 entries</div>
                                            <ul class="pagination mb-0">
                                                <li class="page-item disabled">
                                                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                                                </li>
                                                <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                                <li class="page-item">
                                                    <a class="page-link" href="#">Next</a>
                                                </li>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Settings Tab -->
                    <div class="tab-pane fade" id="settings">
                        <div class="row mb-4">
                            <div class="col-12">
                                <div class="card border-0 shadow-sm">
                                    <div class="card-header bg-white">
                                        <h5 class="mb-0">System Settings</h5>
                                    </div>
                                    <div class="card-body">
                                        <nav>
                                            <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                                <button class="nav-link active" id="nav-general-tab" data-bs-toggle="tab" data-bs-target="#nav-general" type="button" role="tab">
                                                    General
                                                </button>
                                                <button class="nav-link" id="nav-users-tab" data-bs-toggle="tab" data-bs-target="#nav-users" type="button" role="tab">
                                                    Users
                                                </button>
                                                <button class="nav-link" id="nav-appearance-tab" data-bs-toggle="tab" data-bs-target="#nav-appearance" type="button" role="tab">
                                                    Appearance
                                                </button>
                                                <button class="nav-link" id="nav-advanced-tab" data-bs-toggle="tab" data-bs-target="#nav-advanced" type="button" role="tab">
                                                    Advanced
                                                </button>
                                            </div>
                                        </nav>
                                        <div class="tab-content p-3 border border-top-0 rounded-bottom" id="nav-tabContent">
                                            <!-- General Settings -->
                                            <div class="tab-pane fade show active" id="nav-general" role="tabpanel">
                                                <form>
                                                    <div class="mb-3">
                                                        <label for="siteName" class="form-label">Site Name</label>
                                                        <input type="text" class="form-control" id="siteName" value="Pitaara Artist Directory">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="siteDescription" class="form-label">Site Description</label>
                                                        <textarea class="form-control" id="siteDescription" rows="3">A comprehensive directory of artists, musicians, and directors from across the country.</textarea>
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="contactEmail" class="form-label">Contact Email</label>
                                                        <input type="email" class="form-control" id="contactEmail" value="contact@pitaara.com">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="contactPhone" class="form-label">Contact Phone</label>
                                                        <input type="text" class="form-control" id="contactPhone" value="+91 98765 43210">
                                                    </div>
                                                    <div class="mb-3">
                                                        <label for="socialMedia" class="form-label">Social Media Links</label>
                                                        <div class="input-group mb-2">
                                                            <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                                                            <input type="text" class="form-control" placeholder="Facebook URL" value="https://facebook.com/pitaara">
                                                        </div>
                                                        <div class="input-group mb-2">
                                                            <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                                                            <input type="text" class="form-control" placeholder="Instagram URL" value="https://instagram.com/pitaara">
                                                        </div>
                                                        <div class="input-group mb-2">
                                                            <span class="input-group-text"><i class="bi bi-twitter"></i></span>
                                                            <input type="text" class="form-control" placeholder="Twitter URL" value="https://twitter.com/pitaara">
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-purple">Save Changes</button>
                                                </form>
                                            </div>
                                            
                                            <!-- Users Settings -->
                                            <div class="tab-pane fade" id="nav-users" role="tabpanel">
                                                <div class="d-flex justify-content-between mb-3">
                                                    <h5>Admin Users</h5>
                                                    <button class="btn btn-sm btn-purple">
                                                        <i class="bi bi-person-plus me-2"></i>Add New User
                                                    </button>
                                                </div>
                                                <div class="table-responsive">
                                                    <table class="table table-hover">
                                                        <thead>
                                                            <tr>
                                                                <th>Name</th>
                                                                <th>Email</th>
                                                                <th>Role</th>
                                                                <th>Last Login</th>
                                                                <th>Status</th>
                                                                <th>Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Admin User</td>
                                                                <td>admin@pitaara.com</td>
                                                                <td>Super Admin</td>
                                                                <td>Today, 10:30 AM</td>
                                                                <td><span class="badge bg-success">Active</span></td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button class="btn btn-sm btn-outline-primary">
                                                                            <i class="bi bi-pencil"></i>
                                                                        </button>
                                                                        <button class="btn btn-sm btn-outline-danger" disabled>
                                                                            <i class="bi bi-trash"></i>
                                                                        </button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>Content Manager</td>
                                                                <td>manager@pitaara.com</td>
                                                                <td>Editor</td>
                                                                <td>Yesterday, 2:45 PM</td>
                                                                <td><span class="badge bg-success">Active</span></td>
                                                                <td>
                                                                    <div class="btn-group">
                                                                        <button class="btn btn-sm btn-outline-primary">
                                                                            <i class="bi bi-pencil"></i>
                                                                        </button>
                                                                        <button class="btn btn-sm btn-outline-danger">
                                                                            <i class="bi bi-trash"></i>
                                                                        </button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                            
                                            <!-- Appearance Settings -->
                                            <div class="tab-pane fade" id="nav-appearance" role="tabpanel">
                                                <form>
                                                    <div class="mb-3">
                                                        <label class="form-label">Site Theme</label>
                                                        <div class="d-flex gap-3">
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="theme" id="themeDefault" checked>
                                                                <label class="form-check-label" for="themeDefault">
                                                                    Default (Purple & Peach)
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="theme" id="themeDark">
                                                                <label class="form-check-label" for="themeDark">
                                                                    Dark
                                                                </label>
                                                            </div>
                                                            <div class="form-check">
                                                                <input class="form-check-input" type="radio" name="theme" id="themeLight">
                                                                <label class="form-check-label" for="themeLight">
                                                                    Light
                                                                </label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label for="logo" class="form-label">Logo</label>
                                                        <div class="d-flex align-items-center gap-3 mb-2">
                                                            <img src="https://via.placeholder.com/120x60" alt="Current Logo" class="border">
                                                            <div>
                                                                <div class="fw-bold">Current Logo</div>
                                                                <div class="small text-muted">120x60 pixels</div>
                                                            </div>
                                                        </div>
                                                        <input class="form-control" type="file" id="logo">
                                                        <div class="form-text">Recommended size: 240x120 pixels, max file size: 1MB</div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label for="favicon" class="form-label">Favicon</label>
                                                        <div class="d-flex align-items-center gap-3 mb-2">
                                                            <img src="https://via.placeholder.com/32x32" alt="Current Favicon" class="border">
                                                            <div>
                                                                <div class="fw-bold">Current Favicon</div>
                                                                <div class="small text-muted">32x32 pixels</div>
                                                            </div>
                                                        </div>
                                                        <input class="form-control" type="file" id="favicon">
                                                        <div class="form-text">Recommended size: 32x32 pixels, max file size: 500KB</div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label class="form-label">Custom CSS</label>
                                                        <textarea class="form-control font-monospace" rows="5">/* Add your custom CSS here */
.custom-class {
    color: #9B87F5;
}
</textarea>
                                                    </div>
                                                    
                                                    <button type="submit" class="btn btn-purple">Save Changes</button>
                                                </form>
                                            </div>
                                            
                                            <!-- Advanced Settings -->
                                            <div class="tab-pane fade" id="nav-advanced" role="tabpanel">
                                                <form>
                                                    <div class="mb-3">
                                                        <label for="cacheTTL" class="form-label">Cache Time to Live (minutes)</label>
                                                        <input type="number" class="form-control" id="cacheTTL" value="60">
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label for="apiKey" class="form-label">API Key</label>
                                                        <div class="input-group">
                                                            <input type="text" class="form-control" id="apiKey" value="pk_live_12345abcdef" readonly>
                                                            <button class="btn btn-outline-secondary" type="button">
                                                                <i class="bi bi-clipboard"></i>
                                                            </button>
                                                            <button class="btn btn-outline-secondary" type="button">
                                                                <i class="bi bi-arrow-clockwise"></i>
                                                            </button>
                                                        </div>
                                                        <div class="form-text">Use this key to access the Pitaara API</div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label class="form-label">Database Backup</label>
                                                        <div class="d-flex gap-2">
                                                            <button type="button" class="btn btn-outline-primary">
                                                                <i class="bi bi-download me-2"></i>Download Backup
                                                            </button>
                                                            <button type="button" class="btn btn-outline-secondary">
                                                                <i class="bi bi-arrow-clockwise me-2"></i>Create New Backup
                                                            </button>
                                                        </div>
                                                        <div class="form-text">Last backup: Aug 15, 2023, 10:30 AM</div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label class="form-label">System Maintenance</label>
                                                        <div class="form-check form-switch mb-2">
                                                            <input class="form-check-input" type="checkbox" id="maintenanceMode">
                                                            <label class="form-check-label" for="maintenanceMode">Enable Maintenance Mode</label>
                                                        </div>
                                                        <div class="form-text">When enabled, only administrators can access the website.</div>
                                                    </div>
                                                    
                                                    <div class="mb-3">
                                                        <label class="form-label">System Logs</label>
                                                        <div class="d-flex gap-2">
                                                            <button type="button" class="btn btn-outline-secondary">
                                                                <i class="bi bi-eye me-2"></i>View Logs
                                                            </button>
                                                            <button type="button" class="btn btn-outline-danger">
                                                                <i class="bi bi-trash me-2"></i>Clear Logs
                                                            </button>
                                                        </div>
                                                    </div>
                                                    
                                                    <button type="submit" class="btn btn-purple">Save Changes</button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Artist Modal -->
    <div class="modal fade" id="addArtistModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Artist</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="artistName" class="form-label">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="artistName" required>
                            </div>
                            <div class="col-md-6">
                                <label for="artistType" class="form-label">Artist Type <span class="text-danger">*</span></label>
                                <select class="form-select" id="artistType" required>
                                    <option value="" selected disabled>Select Type</option>
                                    <option value="Singer">Singer</option>
                                    <option value="Actor">Actor</option>
                                    <option value="Dancer">Dancer</option>
                                    <option value="Painter">Painter</option>
                                    <option value="Photographer">Photographer</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="artistAge" class="form-label">Age <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="artistAge" min="1" max="120" required>
                            </div>
                            <div class="col-md-4">
                                <label for="artistGender" class="form-label">Gender <span class="text-danger">*</span></label>
                                <select class="form-select" id="artistGender" required>
                                    <option value="" selected disabled>Select Gender</option>
                                    <option value="Male">Male</option>
                                    <option value="Female">Female</option>
                                    <option value="Non-Binary">Non-Binary</option>
                                    <option value="Prefer not to say">Prefer not to say</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="artistExperience" class="form-label">Experience (years)</label>
                                <input type="number" class="form-control" id="artistExperience" min="0" max="70">
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="artistLocation" class="form-label">Location <span class="text-danger">*</span></label>
                                <select class="form-select" id="artistLocation" required>
                                    <option value="" selected disabled>Select Location</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Languages</label>
                                <div class="border rounded p-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="langHindi" value="Hindi">
                                        <label class="form-check-label" for="langHindi">Hindi</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="langEnglish" value="English">
                                        <label class="form-check-label" for="langEnglish">English</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="langPunjabi" value="Punjabi">
                                        <label class="form-check-label" for="langPunjabi">Punjabi</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="langTamil" value="Tamil">
                                        <label class="form-check-label" for="langTamil">Tamil</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="langMore" value="More">
                                        <label class="form-check-label" for="langMore">More...</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="artistPhone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="artistPhone" required>
                            </div>
                            <div class="col-md-6">
                                <label for="artistEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="artistEmail">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="artistBio" class="form-label">Biography</label>
                            <textarea class="form-control" id="artistBio" rows="3"></textarea>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="artistProfilePhoto" class="form-label">Profile Photo <span class="text-danger">*</span></label>
                                <input class="form-control" type="file" id="artistProfilePhoto" required>
                            </div>
                            <div class="col-md-6">
                                <label for="artistWorkSamples" class="form-label">Work Samples</label>
                                <input class="form-control" type="file" id="artistWorkSamples" multiple>
                                <div class="form-text">You can select multiple files</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Social Media Links</label>
                            <div class="input-group mb-2">
                                <span class="input-group-text"><i class="bi bi-instagram"></i></span>
                                <input type="text" class="form-control" placeholder="Instagram profile URL">
                            </div>
                            <div class="input-group mb-2">
                                <span class="input-group-text"><i class="bi bi-facebook"></i></span>
                                <input type="text" class="form-control" placeholder="Facebook profile URL">
                            </div>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-youtube"></i></span>
                                <input type="text" class="form-control" placeholder="YouTube channel URL">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="featuredArtist">
                                <label class="form-check-label" for="featuredArtist">
                                    Feature this artist on the homepage
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-purple">Add Artist</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Musician Modal -->
    <div class="modal fade" id="addMusicianModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Musician</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="musicianName" class="form-label">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="musicianName" required>
                            </div>
                            <div class="col-md-6">
                                <label for="primaryInstrument" class="form-label">Primary Instrument <span class="text-danger">*</span></label>
                                <select class="form-select" id="primaryInstrument" required>
                                    <option value="" selected disabled>Select Instrument</option>
                                    <option value="Guitar">Guitar</option>
                                    <option value="Piano">Piano</option>
                                    <option value="Drums">Drums</option>
                                    <option value="Violin">Violin</option>
                                    <option value="Flute">Flute</option>
                                    <option value="Tabla">Tabla</option>
                                    <option value="Sitar">Sitar</option>
                                    <option value="Vocals">Vocals</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label class="form-label">Secondary Instruments</label>
                                <div class="border rounded p-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="secondGuitar" value="Guitar">
                                        <label class="form-check-label" for="secondGuitar">Guitar</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="secondPiano" value="Piano">
                                        <label class="form-check-label" for="secondPiano">Piano</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="secondDrums" value="Drums">
                                        <label class="form-check-label" for="secondDrums">Drums</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="secondVocals" value="Vocals">
                                        <label class="form-check-label" for="secondVocals">Vocals</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="secondMore" value="More">
                                        <label class="form-check-label" for="secondMore">More...</label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="musicGenre" class="form-label">Music Genre <span class="text-danger">*</span></label>
                                <select class="form-select" id="musicGenre" required>
                                    <option value="" selected disabled>Select Genre</option>
                                    <option value="Classical">Classical</option>
                                    <option value="Rock">Rock</option>
                                    <option value="Pop">Pop</option>
                                    <option value="Jazz">Jazz</option>
                                    <option value="Folk">Folk</option>
                                    <option value="Electronic">Electronic</option>
                                    <option value="Hip Hop">Hip Hop</option>
                                    <option value="Bollywood">Bollywood</option>
                                    <option value="Fusion">Fusion</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="musicianExperience" class="form-label">Experience (years) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="musicianExperience" min="0" max="70" required>
                            </div>
                            <div class="col-md-4">
                                <label for="musicianLocation" class="form-label">Location <span class="text-danger">*</span></label>
                                <select class="form-select" id="musicianLocation" required>
                                    <option value="" selected disabled>Select Location</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            <div class="col-md-4">
                                <label for="albumsReleased" class="form-label">Albums Released</label>
                                <input type="number" class="form-control" id="albumsReleased" min="0" max="100">
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="musicianPhone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="musicianPhone" required>
                            </div>
                            <div class="col-md-6">
                                <label for="musicianEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="musicianEmail">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="musicianBio" class="form-label">Biography</label>
                            <textarea class="form-control" id="musicianBio" rows="3"></textarea>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="musicianProfilePhoto" class="form-label">Profile Photo <span class="text-danger">*</span></label>
                                <input class="form-control" type="file" id="musicianProfilePhoto" required>
                            </div>
                            <div class="col-md-6">
                                <label for="musicSamples" class="form-label">Music Samples</label>
                                <input class="form-control" type="file" id="musicSamples" multiple>
                                <div class="form-text">Accepts MP3, WAV files (max 10MB each)</div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Sample Audio URLs</label>
                            <div class="input-group mb-2">
                                <span class="input-group-text"><i class="bi bi-spotify"></i></span>
                                <input type="text" class="form-control" placeholder="Spotify URL">
                            </div>
                            <div class="input-group mb-2">
                                <span class="input-group-text"><i class="bi bi-youtube"></i></span>
                                <input type="text" class="form-control" placeholder="YouTube URL">
                            </div>
                            <div class="input-group">
                                <span class="input-group-text"><i class="bi bi-soundwave"></i></span>
                                <input type="text" class="form-control" placeholder="SoundCloud URL">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="featuredMusician">
                                <label class="form-check-label" for="featuredMusician">
                                    Feature this musician on the homepage
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-purple">Add Musician</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Director Modal -->
    <div class="modal fade" id="addDirectorModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Director</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="directorName" class="form-label">Full Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="directorName" required>
                            </div>
                            <div class="col-md-6">
                                <label for="directorSpecialization" class="form-label">Specialization <span class="text-danger">*</span></label>
                                <select class="form-select" id="directorSpecialization" required>
                                    <option value="" selected disabled>Select Specialization</option>
                                    <option value="Feature Films">Feature Films</option>
                                    <option value="Short Films">Short Films</option>
                                    <option value="Documentaries">Documentaries</option>
                                    <option value="Music Videos">Music Videos</option>
                                    <option value="TV Commercials">TV Commercials</option>
                                    <option value="Web Series">Web Series</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-4">
                                <label for="directorExperience" class="form-label">Experience (years) <span class="text-danger">*</span></label>
                                <input type="number" class="form-control" id="directorExperience" min="0" max="70" required>
                            </div>
                            <div class="col-md-4">
                                <label for="projectsCompleted" class="form-label">Projects Completed</label>
                                <input type="number" class="form-control" id="projectsCompleted" min="0" max="1000">
                            </div>
                            <div class="col-md-4">
                                <label for="directorLocation" class="form-label">Location <span class="text-danger">*</span></label>
                                <select class="form-select" id="directorLocation" required>
                                    <option value="" selected disabled>Select Location</option>
                                    <option value="Mumbai">Mumbai</option>
                                    <option value="Delhi">Delhi</option>
                                    <option value="Bangalore">Bangalore</option>
                                    <option value="Chennai">Chennai</option>
                                    <option value="Kolkata">Kolkata</option>
                                    <option value="Hyderabad">Hyderabad</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Notable Works</label>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" placeholder="Project Title">
                                <input type="number" class="form-control" placeholder="Year" min="1950" max="2023">
                                <button class="btn btn-outline-secondary" type="button">
                                    <i class="bi bi-plus"></i>
                                </button>
                            </div>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" placeholder="Project Title">
                                <input type="number" class="form-control" placeholder="Year" min="1950" max="2023">
                                <button class="btn btn-outline-secondary" type="button">
                                    <i class="bi bi-plus"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="directorPhone" class="form-label">Phone Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="directorPhone" required>
                            </div>
                            <div class="col-md-6">
                                <label for="directorEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="directorEmail">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="directorBio" class="form-label">Biography</label>
                            <textarea class="form-control" id="directorBio" rows="3"></textarea>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="directorProfilePhoto" class="form-label">Profile Photo <span class="text-danger">*</span></label>
                                <input class="form-control" type="file" id="directorProfilePhoto" required>
                            </div>
                            <div class="col-md-6">
                                <label for="showreelLink" class="form-label">Showreel Link</label>
                                <div class="input-group">
                                    <span class="input-group-text"><i class="bi bi-youtube"></i></span>
                                    <input type="text" class="form-control" id="showreelLink" placeholder="YouTube or Vimeo URL">
                                </div>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="workSamples" class="form-label">Work Samples</label>
                            <input class="form-control" type="file" id="workSamples" multiple>
                            <div class="form-text">Images or short video clips (max 20MB each)</div>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Awards & Recognition</label>
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" placeholder="Award Name">
                                <input type="number" class="form-control" placeholder="Year" min="1950" max="2023">
                                <button class="btn btn-outline-secondary" type="button">
                                    <i class="bi bi-plus"></i>
                                </button>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="featuredDirector">
                                <label class="form-check-label" for="featuredDirector">
                                    Feature this director on the homepage
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-purple">Add Director</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Add Location Modal -->
    <div class="modal fade" id="addLocationModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Add New Location</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationName" class="form-label">Location Name <span class="text-danger">*</span></label>
                                <input type="text" class="form-control" id="locationName" required>
                            </div>
                            <div class="col-md-6">
                                <label for="locationType" class="form-label">Location Type <span class="text-danger">*</span></label>
                                <select class="form-select" id="locationType" required>
                                    <option value="" selected disabled>Select Type</option>
                                    <option value="Film Studio">Film Studio</option>
                                    <option value="Recording Studio">Recording Studio</option>
                                    <option value="Performance Venue">Performance Venue</option>
                                    <option value="Art Gallery">Art Gallery</option>
                                    <option value="Theater">Theater</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationAddress" class="form-label">Address <span class="text-danger">*</span></label>
                                <textarea class="form-control" id="locationAddress" rows="3" required></textarea>
                            </div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="locationCity" class="form-label">City <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="locationCity" required>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="locationState" class="form-label">State <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="locationState" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="locationPincode" class="form-label">PIN Code <span class="text-danger">*</span></label>
                                        <input type="text" class="form-control" id="locationPincode" required>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationCapacity" class="form-label">Capacity/Size</label>
                                <select class="form-select" id="locationCapacity">
                                    <option value="" selected disabled>Select Capacity</option>
                                    <option value="Small">Small (< 50 people)</option>
                                    <option value="Medium">Medium (50-200 people)</option>
                                    <option value="Large">Large (> 200 people)</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label for="locationFacilities" class="form-label">Facilities Available</label>
                                <div class="border rounded p-2">
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="facParking" value="Parking">
                                        <label class="form-check-label" for="facParking">Parking</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="facWifi" value="WiFi">
                                        <label class="form-check-label" for="facWifi">WiFi</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="facFood" value="Food">
                                        <label class="form-check-label" for="facFood">Food</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="facAc" value="AC">
                                        <label class="form-check-label" for="facAc">AC</label>
                                    </div>
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="facMore" value="More">
                                        <label class="form-check-label" for="facMore">More...</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationContact" class="form-label">Contact Number <span class="text-danger">*</span></label>
                                <input type="tel" class="form-control" id="locationContact" required>
                            </div>
                            <div class="col-md-6">
                                <label for="locationEmail" class="form-label">Email</label>
                                <input type="email" class="form-control" id="locationEmail">
                            </div>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationRentalFee" class="form-label">Rental Fee (per day)</label>
                                <div class="input-group">
                                    <span class="input-group-text">₹</span>
                                    <input type="number" class="form-control" id="locationRentalFee">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label for="locationAvailability" class="form-label">Availability</label>
                                <select class="form-select" id="locationAvailability">
                                    <option value="Available">Available</option>
                                    <option value="Booked">Booked</option>
                                    <option value="Maintenance">Under Maintenance</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="locationDescription" class="form-label">Description</label>
                            <textarea class="form-control" id="locationDescription" rows="3"></textarea>
                        </div>
                        
                        <div class="row mb-3">
                            <div class="col-md-6">
                                <label for="locationPhotos" class="form-label">Location Photos</label>
                                <input class="form-control" type="file" id="locationPhotos" multiple>
                                <div class="form-text">You can select multiple files</div>
                            </div>
                            <div class="col-md-6">
                                <label for="locationWebsite" class="form-label">Website URL</label>
                                <input type="url" class="form-control" id="locationWebsite" placeholder="https://example.com">
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="locationGoogleMaps" class="form-label">Google Maps Embed Code</label>
                            <textarea class="form-control" id="locationGoogleMaps" rows="2" placeholder="<iframe src=&quot;https://maps.google.com/...&quot;></iframe>"></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="featuredLocation">
                                <label class="form-check-label" for="featuredLocation">
                                    Feature this location on the homepage
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-purple">Add Location</button>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Upload Media Modal -->
    <div class="modal fade" id="uploadMediaModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Upload Media</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label for="mediaTitle" class="form-label">Title <span class="text-danger">*</span></label>
                            <input type="text" class="form-control" id="mediaTitle" required>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaType" class="form-label">Media Type <span class="text-danger">*</span></label>
                            <select class="form-select" id="mediaType" required>
                                <option value="" selected disabled>Select Type</option>
                                <option value="Image">Image</option>
                                <option value="Audio">Audio</option>
                                <option value="Video">Video</option>
                                <option value="Document">Document</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaFile" class="form-label">File <span class="text-danger">*</span></label>
                            <input class="form-control" type="file" id="mediaFile" required>
                            <div class="form-text">
                                Maximum file size: 50MB<br>
                                Supported formats: JPG, PNG, MP3, MP4, PDF
                            </div>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaDescription" class="form-label">Description</label>
                            <textarea class="form-control" id="mediaDescription" rows="3"></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaCategory" class="form-label">Category</label>
                            <select class="form-select" id="mediaCategory">
                                <option value="" selected disabled>Select Category</option>
                                <option value="Profile Photos">Profile Photos</option>
                                <option value="Work Samples">Work Samples</option>
                                <option value="Promotional">Promotional</option>
                                <option value="Documents">Documents</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaRelatedTo" class="form-label">Related To</label>
                            <select class="form-select" id="mediaRelatedTo">
                                <option value="" selected>None</option>
                                <optgroup label="Artists">
                                    <option value="ART001">Rahul Sharma (ART001)</option>
                                    <option value="ART002">Priya Patel (ART002)</option>
                                </optgroup>
                                <optgroup label="Musicians">
                                    <option value="MUS001">Aditya Kapoor (MUS001)</option>
                                    <option value="MUS002">Meera Desai (MUS002)</option>
                                </optgroup>
                                <optgroup label="Directors">
                                    <option value="DIR001">Amitabh Verma (DIR001)</option>
                                </optgroup>
                                <optgroup label="Locations">
                                    <option value="LOC001">Film City (LOC001)</option>
                                </optgroup>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label for="mediaTags" class="form-label">Tags</label>
                            <input type="text" class="form-control" id="mediaTags" placeholder="Enter tags separated by commas">
                            <div class="form-text">Example: portrait, headshot, promotional</div>
                        </div>
                        
                        <div class="mb-3">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="mediaPublic" checked>
                                <label class="form-check-label" for="mediaPublic">
                                    Make this media publicly visible
                                </label>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-purple">Upload</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap 5 JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JavaScript -->
    <!-- <script src="script.js"></script> -->
    <script src="scripts.js"></script>
</body>
</html>
