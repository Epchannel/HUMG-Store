<div class="row">
	<ol class="breadcrumb">
		<li><a href="#"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg></a></li>
		<li class="active">Đối tác vận chuyển</li>
	</ol>
</div><!--/.row-->

<div class="row">
	<div class="col-lg-12">
		<div class="panel panel-info">
			<div class="panel-heading">
			<div class="col-md-8">Đối tác vận chuyển</div>
			</div>
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="info">					
								<th>Tên Đối tác</th>
								<th>Địa chỉ</th>
                                                                <th>Thay đổi địa chỉ</th>
							</tr>
						</thead>
						<tbody>
							<?php foreach ($shipping as $value) { ?>
								<tr>
									<td><strong><?php echo $value->name; ?></strong></td>
									<td>
                                                                            <?php 
                                                                                echo $value->name_province.'-'.$value->name_district;
                                                                            ?>
                                                                        </td>
									
									<td class="list_td aligncenter">
							            <a href="../admin/shipping/edit/<?php echo $value->id; ?>" title="Sửa"><span class="glyphicon glyphicon-edit"></span></a>&nbsp;&nbsp;&nbsp;
							           
								    </td>    
				                </tr>
							<?php } ?>
			    		</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div><!--/.row-->
