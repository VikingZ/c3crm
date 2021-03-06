{foreach key=label item=subdata from=$data}
	<tr>
	{foreach key=mainlabel item=maindata from=$subdata}
		{assign var="uitype" value="$maindata[0][0]"}
		{assign var="fldlabel" value="$maindata[1][0]"}
		{assign var="fldlabel_sel" value="$maindata[1][1]"}
		{assign var="fldlabel_combo" value="$maindata[1][2]"}
		{assign var="fldname" value="$maindata[2][0]"}
		{assign var="fldvalue" value="$maindata[3][0]"}
		{assign var="secondvalue" value="$maindata[3][1]"}
		{assign var="thirdvalue" value="$maindata[3][2]"}
		{assign var="fourthvalue" value="$maindata[3][3]"}
		{assign var="vt_tab" value="$maindata[4][0]"}
		{assign var="readonly" value="$maindata[0][1]"}
		{assign var="mandatory" value="$maindata[0][2]"}
		{if $readonly eq '0'}
		        {assign var="disable" value=" disabled "}
		{else}
		        {assign var="disable" value=" "}
		{/if}
		{if $mandatory eq '1'}
		        {assign var="required" value=" <font color='red'>*</font> "}
		{else}
		        {assign var="required" value=" "}
		{/if}

		{if $uitype eq 2}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} type="text" name="{$fldname}" id="{$fldname}" value="{$fldvalue}" >
			</td>
		{elseif $uitype eq 11 || $uitype eq 1 || $uitype eq 13 || $uitype eq 7 || $uitype eq 9}
			<td class="dvt">{$required}{$fldlabel}</td>
			<td class="dvn"><input{$disable} type="text" name="{$fldname}" id ="{$fldname}" value="{$fldvalue}" ></td>
		{elseif $uitype eq 10}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} readonly name="{$thirdvalue}" type="text" value="{$fldvalue}"><input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">&nbsp;<img src="{$IMAGE_PATH}select.gif" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick="return openUITenPopup('{$fourthvalue}');" align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;<img{$disable}  src="{$IMAGE_PATH}clear_field.gif" alt="{$APP.LBL_CLEAR_BUTTON_LABEL}" title="{$APP.LBL_CLEAR_BUTTON_LABEL}" LANGUAGE=javascript onClick="document.EditView.{$thirdvalue}.value=''; document.EditView.{$fldname}.value='';return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>
		{elseif $uitype eq 19 || $uitype eq 20}
			<!-- In Add Comment are we should not display anything -->
			{if $fldlabel eq $MOD.LBL_ADD_COMMENT}
				{assign var=fldvalue value=""}
			{/if}
			<td class="dvt">
				{$required}
				{$fldlabel}
			</td>
			<td colspan=3>
            {if $MODULE eq 'Maillisttmps' || $MODULE eq 'Qunfatmps'}
				<textarea{$disable} class="detailedViewTextBox"  name="{$fldname}"   style="width:900px;height:50px;" >{$fldvalue|escape}</textarea>
                {else}
                <textarea{$disable} class="detailedViewTextBox"  name="{$fldname}"   style="width:900px;height:50px;">{$fldvalue|escape}</textarea>
                {/if}
			</td>
		{elseif $uitype eq 21 || $uitype eq 24}
			<td class="dvt">
				{$required}
				{$fldlabel}
			</td>
			<td class="dvn">
				<textarea{$disable} value="{$fldvalue}" name="{$fldname}" style="width:350px;height:50px;">{$fldvalue|escape}</textarea>
			</td>
		{elseif $uitype eq 15 || $uitype eq 16 || $uitype eq 111} <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td class="dvt">
				{$required}
				{$fldlabel}
			</td>
			<td class="dvn">
			   <select{$disable} name="{$fldname}" class="input-small">
				{foreach item=arr from=$fldvalue}
					{foreach key=sel_value item=value from=$arr}
						<option value="{$sel_value}" {$value}>                                                
                                                        {$sel_value}
                                                </option>
												
					{/foreach}
				{/foreach}
			   </select>
			   {if $fldname=="memday940"}
				<select name="memday942" class="input-mini">
					<option>月</option>
				</select>
				<select name="memday944" class="input-mini">
					<option>日</option>
				</select>
			   {/if}
			</td>
        {elseif $uitype eq 155} <!-- uitype 111 added for noneditable existing picklist values - ahmed -->
			<td class="dvt">
				{$required}
				{$fldlabel}
			</td>
			<td class="dvn">
			   <select{$disable} name="{$fldname}" class="small">
				{foreach item=arr from=$fldvalue}
						<option value="{$arr.0.0}" {$arr.1}>                                                
                                                        {$arr.0.1}
                                                </option>
				{/foreach}
			   </select>
			</td>
        {elseif $uitype eq 1021 || $uitype eq 1022|| $uitype eq 1023}
			<td class="dvt">
				{$required}
				{$fldlabel}
			</td>
			<td class="dvn">
			   <select{$disable} name="{$fldname}" id="{$fldname}" class="small" onchange="multifieldSelectChange('{$uitype}','{$secondvalue}','{$MODULE}',this);">
				{foreach item=value from=$fldvalue}

						<option value="{$value[1]}" relvalue="{$value[0]}" {$value[2]}>
                                                        {$value[1]}

				{/foreach}
			   </select>
			</td>
		{elseif $uitype eq 33}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
			   <select{$disable} MULTIPLE name="{$fldname}[]" size="4" style="width:160px;" class="small">
                                                                                        {foreach key=key_one item=arr from=$fldvalue}
				                    					{foreach key=sel_value item=value from=$arr}
                    										<option value="{$sel_value}" {$value}>{$sel_value}</option>		
                    									{/foreach}
											{/foreach}
			   </select>
			</td>

		{elseif $uitype eq 53}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">	
				<select{$disable} name="assigned_user_id" class="small">
					{foreach key=key_one item=arr from=$fldvalue}
						{foreach key=sel_value item=value from=$arr}
							<option value="{$key_one}" {$value}>{$sel_value}</option>
						{/foreach}
					{/foreach}
				</select>				
			</td>
		{elseif $uitype eq 54}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">				
				<select{$disable} name="{$fldname}" class="small">
				{foreach key=key_one item=arr from=$fldvalue}
					{foreach key=sel_value item=value from=$arr}
						<option value="{$sel_value}" {$value}>{$sel_value}</option>
					{/foreach}
				{/foreach}
				</select>
			</td>
		{elseif $uitype eq 52 || $uitype eq 77}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				{if $uitype eq 52}
					<select{$disable} name="assigned_user_id" class="small">
				{elseif $uitype eq 77}
					<select{$disable} name="assigned_user_id" class="small">
				{else}
					<select{$disable} name="{$fldname}" class="small">
				{/if}

				{foreach key=key_one item=arr from=$fldvalue}
					{foreach key=sel_value item=value from=$arr}
						<option value="{$key_one}" {$value}>{$sel_value}</option>
					{/foreach}
				{/foreach}
				</select>
			</td>
		{elseif $uitype eq 1004}
		        <td  class="dvtCellLabel" align="right">
				{$required}{$fldlabel}
			</td>
			<td  align="left" class="dvtCellInfo">
				{$fldvalue}
			</td>
		{elseif $uitype eq 51}
			{if $MODULE eq 'Accounts'}
				{assign var='popuptype' value = 'specific_account_address'}
			{else}
				{assign var='popuptype' value = 'specific_contact_account_address'}
			{/if}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} readonly name="account_name" type="text" style="width:300px;" value="{$fldvalue}" >
				<input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">
                <br>①直接查客户: <input style='border: 1px solid rgb(186, 186, 186);' id='account_search_val' name='account_search_val' type="text" >&nbsp;<i class="cus-zoom" onclick='SearchAccountVal();'></i>
                <br>②浏览选客户: <i class="cus-zoom" onclick="BrowerAcct('{$popuptype}');" style='cursor:hand;cursor:pointer'></i>&nbsp;<img{$disable}  src="{$IMAGE_PATH}clear_field.gif" alt="{$APP.LBL_CLEAR_BUTTON_LABEL}" title="{$APP.LBL_CLEAR_BUTTON_LABEL}" LANGUAGE=javascript onClick="document.EditView.account_id.value=''; document.EditView.account_name.value='';return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>

		{elseif $uitype eq 50}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} readonly name="account_name" class="detailedViewTextBox"  type="text" value="{$fldvalue}"><input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">
                <br>①直接查客户: <input style='border: 1px solid rgb(186, 186, 186);' id='account_search_val' name='account_search_val' type="text">&nbsp;<input type='button' value='查' onclick='SearchAccountVal();'>
                <br>②浏览选客户: <img src="{$IMAGE_PATH}select.gif" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='return window.open("index.php?module=Accounts&action=Popup&popuptype=specific&form=TasksEditView&form_submit=false","test","width=700,height=602,resizable=1,scrollbars=1");' align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>
		{elseif $uitype eq 73}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} readonly class="detailedViewTextBox" name="account_name" type="text" value="{$fldvalue}"><input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">&nbsp;
                <br>①直接查客户:<input style='border: 1px solid rgb(186, 186, 186);' id='account_search_val' name='account_search_val' type="text">&nbsp;<input type='button' value='查' onclick='SearchAccountVal();'>
                <br>②浏览选客户:<img src="{$IMAGE_PATH}select.gif" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='return window.open("index.php?module=Accounts&action=Popup&popuptype=specific_account_address&form=TasksEditView&form_submit=false","test","width=700,height=602,resizable=1,scrollbars=1");' align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>

		{elseif $uitype eq 57}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			
				<td class="dvn">
                  <select{$disable} name="{$fldname}"  id="{$fldname}">
                      {$fldvalue}
                  </select>
                </td>
	
		{elseif $uitype eq 80}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} name="salesorder_name" readonly type="text"  value="{$fldvalue}"><input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">&nbsp;<img src="{$IMAGE_PATH}select.gif" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='return openSOPopup()' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;<img{$disable}  src="{$IMAGE_PATH}clear_field.gif" alt="{$APP.LBL_CLEAR_BUTTON_LABEL}" title="{$APP.LBL_CLEAR_BUTTON_LABEL}" LANGUAGE=javascript onClick="document.EditView.salesorder_id.value=''; document.EditView.salesorder_name.value='';return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>

		{elseif $uitype eq 76}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} name="potential_name" readonly type="text"  value="{$fldvalue}"><input{$disable} name="{$fldname}" type="hidden" value="{$secondvalue}">&nbsp;<img src="{$IMAGE_PATH}select.gif" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='return openPotentialPopup();' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;<img{$disable}  src="{$IMAGE_PATH}clear_field.gif" alt="{$APP.LBL_CLEAR_BUTTON_LABEL}" title="{$APP.LBL_CLEAR_BUTTON_LABEL}" LANGUAGE=javascript onClick="document.EditView.potential_id.value=''; document.EditView.potential_name.value='';return false;" align="absmiddle" style='cursor:hand;cursor:pointer'>
			</td>

		{elseif $uitype eq 17}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
				
			</td>

		{elseif $uitype eq 85}
                        <td class="dvt">
                                {$required}{$fldlabel}
                        </td>
                        <td class="dvn">
                                <img src="{$IMAGE_PATH}skype.gif" align="absmiddle"></img>
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
				
                        </td>
		{elseif $uitype eq 86}
                        <td class="dvt">
                                {$required}{$fldlabel}
                        </td>
                        <td class="dvn">
                                <img border="0" src="{$IMAGE_PATH}qq.gif"  align="absmiddle">
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
                        </td>
		{elseif $uitype eq 87}
                        <td class="dvt">
                                {$required}{$fldlabel}
                        </td>
                        <td class="dvn">
                                <img src="{$IMAGE_PATH}msn.jpg" align="absmiddle"></img>
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
                        </td>
		{elseif $uitype eq 88}
                        <td class="dvt">
                                {$required}{$fldlabel}
                        </td>
                        <td class="dvn">
                                <img src="{$IMAGE_PATH}trade.jpg" align="absmiddle">
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
                        </td>
		{elseif $uitype eq 89}
                        <td class="dvt">
                                {$required}{$fldlabel}
                        </td>
                        <td class="dvn">
                                <img src="{$IMAGE_PATH}yahoo.gif" align="absmiddle">
				<input{$disable} type="text" name="{$fldname}" id ="{$fldname}" class="detailedViewTextBox"  value="{$fldvalue}">
                        </td>

		{elseif $uitype eq 71 || $uitype eq 72}
			<td class="dvt">
				{$fldlabel}
			</td>
			<td class="dvn">
				<input{$disable} name="{$fldname}" type="text"     value="{$fldvalue}">
			</td>


		{elseif $uitype eq 5}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<div class="input-append date" id="jscal_field_{$fldname}"  data-date="{$fldvalue}" data-date-format="yyyy-mm-dd">
                  <input {$disable} type="text" name="{$fldname}"  value="{$fldvalue}"  style="width:100px;">
                  <span class="add-on"><i class="cus-date"></i></span>
                </div> 
                <script>
	                $(function(){ldelim} 
				      $("#jscal_field_{$fldname}").datepicker();
				    {rdelim}); 
				</script>
			<!-- 	<input{$disable} name="{$fldname}" id="jscal_field_{$fldname}" type="text"  size="11" maxlength="10" value="{$fldvalue}">
				<img src="{$IMAGE_PATH}calendar.gif" id="jscal_trigger_{$fldname}" onclick="javascript:displayCalendar('jscal_field_{$fldname}',this)">  -->

			</td>

		{elseif $uitype eq 22}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				<textarea{$disable} name="{$fldname}" cols="30" rows="2">{$fldvalue}</textarea>
			</td>

		{elseif $uitype eq 61}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td colspan="3" class="dvn">
				<input{$disable} name="{$fldname}"  type="file" value="{$secondvalue}" />
				<input{$disable} type="hidden" name="id" value=""/>{$fldvalue}
			</td>
		{elseif $uitype eq 104}<!-- Mandatory Email Fields -->			
			 <td class="dvt">
			 {$required}
			 {$fldlabel}
			 </td>
    			<td class="dvn"><input{$disable} type="text" name="{$fldname}" id ="{$fldname}" value="{$fldvalue}"   ></td>
		{elseif $uitype eq 103}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td width="30%" colspan="3" align="left" class="dvtCellInfo">
				<input{$disable} type="text" name="{$fldname}" value="{$fldvalue}"   >
			</td>	
			
			
		{elseif $uitype eq 106}
			<td class="dvt">
				{$required}{$fldlabel}
			</td>
			<td class="dvn">
				{if $MODE eq 'edit'}
				<input{$disable} type="text" readonly name="{$fldname}" value="{$fldvalue}"   >
				{else}
				<input{$disable} type="text" name="{$fldname}" value="{$fldvalue}"   >
				{/if}
			</td>

		
		
		{/if}
	{/foreach}
   </tr>
{/foreach}
