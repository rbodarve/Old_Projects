	<table class="form" cellpadding="0" cellspacing="0" width="100%">
								<tbody>
									<tr>
										<td>
										ADD FROM EXISTING
										</td>
										<td>
											<select name="training">
											<option value=""></option>
											<?php
												$training2=new Training();
												$training2->loadAll();
											?>
											<?php
												while($r=$training2->result->FetchRow())
												{
											?>
												<option value='<?php echo $r['training_title'];?>'>
													<?php echo $r['training_title'];?>
												</option>
											<?php
												}
											?>
											</select>
										</td>
									</tr>
									<tr>
										<td>
										Training Title
										</td>
										<td>
											<input type="text" name="training_title" id="training_title" value="<?php echo $training-> training_title;?>" size="50">
										</td>
										
									</tr>
									<tr>
										<td>
										Start Date
										</td>
										<td>
											<input type="text" name="start_date"  id="start_date" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_start_date" title="Date selector" align="absmiddle" class="jscalimg"/>
											<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "start_date",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_start_date",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>
										
									</tr>
									<tr>
										<td>
										End Date
										</td>
										<td>
											<input type="text" name="end_date"  id="end_date" value="<?php echo date("Y-m-d");?>" size="8" readonly  style="text-align:center;"/>            								
 										<img src="js/jscalendar/icons/calendar5.gif" id="tg_end_date" title="Date selector" align="absmiddle" class="jscalimg"/>
											<!-- Calendar setup script -->
											<script type="text/javascript">
						    					Calendar.setup({
        													inputField     :    "end_date",     // id of the input field
        													ifFormat       :    "%Y-%m-%d",      // format of the input field ifFormat       :    "%B %e, %Y",
        													button         :    "tg_end_date",  // trigger for the calendar (button ID)
        													align          :    "Tl",           // alignment (defaults to "Bl")
        													singleClick    :    true
    															});
											</script>	
										</td>
										
									</tr>
									<tr>
										<td>
										Location
										</td>
										<td>
											<input type="text" name="location" id="location" value="<?php echo $training-> location;?>" size="50">
										</td>
										
									</tr>
									<tr>
										<td>
										City
										</td>
										<td>
											<input type="text" name="city" id="city" value="<?php echo $training-> city;?>" size="50">
										</td>
									</tr>
									<tr>
										<td>
										Organizer(s)
										</td>
										<td>
											<input type="text" name="organizer" id="organizer" value="<?php echo $training-> location;?>" size="50">
										</td>
									</tr>
									<tr>
										<td>
										Type
										</td>
										<td>
											<select name="type">
											<option value=""></option>
											<option value="Workshop">Workshop</option>
											<option value="Conference">Conference</option>
											<option value="Seminar">Seminar</option>
											<option value="Competition">Competition</option>
											<option value="Others">Others</option>
											</select>
										</td>
									</tr>
									<tr>
										<td>
										Training Description
										</td>
										<td>
											<textarea type="longtext" name="organizer" id="organizer" value="<?php echo $training-> location;?>" rows="5" cols="50"></textarea>
										</td>
									</tr>
									
									<tr>
										<td>
										Remarks
										</td>
										<td>
											<textarea  name="remarks" id="remarks" value="<?php echo $training->remarks;?>" rows="5" cols="50"></textarea>
										</td>
										
									</tr>	
									<tr>
										<td>
										<br>
											BUDGET
										</td>
									</tr>
									<tr>
										<td>
										Budget Allocated
										</td>
										<td>
											<input type="text" name="budget_allocated" id="budget_allocated" value="<?php echo $budget-> budget_allocated;?>" size="20">Php
										</td>	
									</tr>
									<tr>
										<td>
										Actual Expense
										</td>
										<td>
											<input type="text" name="budget_actual" id="budget_actual" value="<?php echo $budget-> budget_actual;?>" size="20">Php
										</td>
										
									</tr>
									
									<tr>
										<td>
										<label for="file">Filename:</label>
										<td>
										<input type="file" name="file" id="file" /> 
										</td>
										</td>
									</tr>
									
								</tbody>
							
							
							</table>