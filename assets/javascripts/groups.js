/**
 * Created by dx-sadaf on 2/23/15.
 */

jQuery(document).ready(function (){
    $('input[type=checkbox][id^="workload_groups_"]').change(function (){
        var $this = $(this);
        //var group_id = $this.attr("id").substr(16);
        var group_id = $this.val();
        $.each(group_members,function (i, gp){
            gp = gp.group;
            if(gp.id == group_id){
                var checked = $this.is(":checked");
                $.each(gp.users, function (j,usr){
                    if(checked){
                        $("select#workload_users option[value='"+usr.id+"']").attr("selected", "selected");
                    }else{
                        $("select#workload_users option[value='"+usr.id+"']").removeAttr("selected")
                    }
                });
            }
        });

        $('.selected-count').html( $("select#workload_users option:selected").length + " selected members" );
    });

    $('#workload_select_none').click(function (){
        $("select#workload_users option").removeAttr("selected");
        $('input[type=checkbox][id^="workload_groups_"]').removeAttr("checked");
        $('.selected-count').html( $("select#workload_users option:selected").length + " selected members" );
        return false;
    });

    $('#workload_select_all').click(function (){

        $("select#workload_users option").attr("selected","selected");
        $('input[type=checkbox][id^="workload_groups_"]').attr("checked","checked");
        $('.selected-count').html( $("select#workload_users option:selected").length + " selected members" );
        return false;
    });

	$("select#workload_users").change(function (){
		$('.selected-count').html( $("select#workload_users option:selected").length + " selected members" );
		return true;
	});


});
