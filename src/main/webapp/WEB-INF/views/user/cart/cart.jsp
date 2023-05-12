<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/taglib.jsp"%>

<div class="section-top-border">
	<h3 class="mb-30">Table</h3>
	<div class="progress-table-wrap">
		<div class="progress-table">
			<div class="table-head">
				<div class="serial">#</div>
				<div class="country">Countries</div>
				<div class="visit">Visits</div>
				<div class="percentage">Percentages</div>
			</div>
			<div class="table-row">
				<div class="serial">01</div>
				<div class="country">
					<img src="img/elements/f1.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-1" role="progressbar"
							style="width: 80%" aria-valuenow="80" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">02</div>
				<div class="country">
					<img src="img/elements/f2.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-2" role="progressbar"
							style="width: 30%" aria-valuenow="30" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">03</div>
				<div class="country">
					<img src="img/elements/f3.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-3" role="progressbar"
							style="width: 55%" aria-valuenow="55" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">04</div>
				<div class="country">
					<img src="img/elements/f4.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-4" role="progressbar"
							style="width: 60%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">05</div>
				<div class="country">
					<img src="img/elements/f5.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-5" role="progressbar"
							style="width: 40%" aria-valuenow="40" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">06</div>
				<div class="country">
					<img src="img/elements/f6.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-6" role="progressbar"
							style="width: 70%" aria-valuenow="70" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">07</div>
				<div class="country">
					<img src="img/elements/f7.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-7" role="progressbar"
							style="width: 30%" aria-valuenow="30" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
			<div class="table-row">
				<div class="serial">08</div>
				<div class="country">
					<img src="img/elements/f8.jpg" alt="flag">Canada
				</div>
				<div class="visit">645032</div>
				<div class="percentage">
					<div class="progress">
						<div class="progress-bar color-8" role="progressbar"
							style="width: 60%" aria-valuenow="60" aria-valuemin="0"
							aria-valuemax="100"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="section-top-border">
	<div class="row">
		<div class="col-lg-8 col-md-8">
			<h3 class="mb-30">Form Element</h3>
			<form action="#">
				<div class="mt-10">
					<input type="text" name="first_name" placeholder="First Name"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'First Name'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="last_name" placeholder="Last Name"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Last Name'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="text" name="last_name" placeholder="Last Name"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Last Name'" required
						class="single-input">
				</div>
				<div class="mt-10">
					<input type="email" name="EMAIL" placeholder="Email address"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Email address'" required
						class="single-input">
				</div>
				<div class="input-group-icon mt-10">
					<div class="icon">
						<i class="fa fa-thumb-tack" aria-hidden="true"></i>
					</div>
					<input type="text" name="address" placeholder="Address"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Address'" required
						class="single-input">
				</div>
				<div class="input-group-icon mt-10">
					<div class="icon">
						<i class="fa fa-plane" aria-hidden="true"></i>
					</div>
					<div class="form-select" id="default-select"">
						<select>
							<option value=" 1">City</option>
							<option value="1">Dhaka</option>
							<option value="1">Dilli</option>
							<option value="1">Newyork</option>
							<option value="1">Islamabad</option>
						</select>
					</div>
				</div>
				<div class="input-group-icon mt-10">
					<div class="icon">
						<i class="fa fa-globe" aria-hidden="true"></i>
					</div>
					<div class="form-select" id="default-select"">
						<select>
							<option value=" 1">Country</option>
							<option value="1">Bangladesh</option>
							<option value="1">India</option>
							<option value="1">England</option>
							<option value="1">Srilanka</option>
						</select>
					</div>
				</div>

				<div class="mt-10">
					<textarea class="single-textarea" placeholder="Message"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Message'" required></textarea>
				</div>
				<!-- For Gradient Border Use -->
				<!-- <div class="mt-10">
										<div class="primary-input">
											<input id="primary-input" type="text" name="first_name" placeholder="Primary color" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Primary color'">
											<label for="primary-input"></label>
										</div>
									</div> -->
				<div class="mt-10">
					<input type="text" name="first_name" placeholder="Primary color"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Primary color'" required
						class="single-input-primary">
				</div>
				<div class="mt-10">
					<input type="text" name="first_name" placeholder="Accent color"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Accent color'" required
						class="single-input-accent">
				</div>
				<div class="mt-10">
					<input type="text" name="first_name" placeholder="Secondary color"
						onfocus="this.placeholder = ''"
						onblur="this.placeholder = 'Secondary color'" required
						class="single-input-secondary">
				</div>
			</form>
		</div>
	</div>
</div>