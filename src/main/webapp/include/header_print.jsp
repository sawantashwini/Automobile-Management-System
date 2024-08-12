<div
			style="float: left; width: 578px; border: 1px solid; border-bottom: none;">




			<div
				style="width: 100%; float: left; font-size: 20px; color: #000; text-align: center;">

				<div style="width: 20%; float: left; font-size: 19px;">
					<img src="ProjectImage/<%=project.getId()%>.jpg"
						onerror="this.src='assets/img/logo.jpg'"
						style="float: left; width: 80px;">
					<div style="float: left; width: 100%;">
						<div
							style="width: 90%; float: left; font-size: 11px; color: #000; padding: 0px 5px 0px;">
							<%
						if (bill_dto.getGst_status().equalsIgnoreCase("yes")) {
						%>
							<b>GSTIN -</b> 12345

							<%
						}
						%>
						</div>
						<div
							style="width: 100%; float: left; font-size: 11px; text-align: right; color: #000; padding: 0px 5px 0; display: none;">
							<b>Mobile -</b>9826607332
						</div>
					</div>
				</div>

				<div style="width: 60%; float: left; font-size: 21px;">




					<span
						style="font-size: 21px; width: 100%; float: left; margin-top: 5px;">
						<b style="color: #f00;"><%=project.getNAME()%></b>
					</span> <span
						style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
						Address : <%=project.getLocal_address()%></span> <span
						style="font-size: 13px; width: 100%; float: left; margin-top: 5px;">
						Mob. : <%=project.getMobile_no()%></span> <span
						style="font-size: 15px; width: 100%; float: left; margin-top: 10px;"><b>INVOICE
					</b> </span>


				</div>



			</div>


		</div>