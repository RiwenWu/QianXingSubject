var ajaxConfig = {
    type: "POST",
    dataType: "json",
    async: false
};

/**
 * AJAX JSON 方式
 * @param url
 * @param data
 * @param successFn
 * @param errorFn
 */
function ajaxSubmit(url, data, successFn, errorFn) {
    ajaxConfig.url = url;
    ajaxConfig.contentType = 'application/json;charset=UTF-8';
    if (data != null) {
        ajaxConfig.data = data;
    };
    ajaxConfig.success = function (data) {
        successFn(data);
    };
    ajaxConfig.error = function (data) {
        errorFn(data);
    };
    $.ajax(ajaxConfig);
};

/**
 * AJAX Form 表单方式 $(this).serialize()
 * @param url
 * @param data
 * @param successFn
 * @param errorFn
 */
function ajaxSubmitForm(url, data, successFn, errorFn) {
    ajaxConfig.url = url;
    ajaxConfig.contentType = 'application/x-www-form-urlencoded;charset=utf-8';
    if (data != null) {
        ajaxConfig.data = data;
    };
    ajaxConfig.success = function (data) {
        successFn(data);
    };
    ajaxConfig.error = function (data) {
        errorFn(data);
    };
    $.ajax(ajaxConfig);
};


/**
 *显示与隐藏
 */
function controlToggle(){
    if(addOff==true){
        $("#rev").hide(200);
        $("#add").show(200);
        $("#addForm").toggle(200);
        $("#editForm").hide(200);
        //
        $("#edit_rev").hide(200);
        $("#edit_add").show(200);
        addOff = false;
    }else{
        $("#rev").show(200);
        $("#add").hide(200);
        $("#addForm").toggle(200);
        $("#editForm").hide(200);
        //
        $("#edit_rev").hide(200);
        $("#edit_add").show(200);

        addOff = true;
    }

}


function editToggle(){
    if(editOff==true){
        $("#edit_rev").hide(200);
        $("#edit_add").show(200);
        $("#editForm").toggle(200);
        $("#addForm").hide(200);
        $("#rev").hide(200);
        $("#add").show(200);
        editOff = false;
    }else{
        $("#edit_rev").show(200);
        $("#edit_add").hide(200);
        $("#editForm").toggle(200);
        $("#addForm").hide(200);
        $("#rev").hide(200);
        $("#add").show(200);
        editOff = true;
    }

    if(!clickEditIs){
        $("#editName").attr("disabled","disabled");
        $("#editAlias").attr("disabled","disabled");
    }
}



/* 新增标签与分类的form验证 */
function addFormCheck(){
    $("#addForm").bootstrapValidator({
        message: 'This value is not valid.',
        feedbackIcons: {
            valid: 'glyphicon',
            invalid: 'glyphicon ',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入名称'
                    },
                    stringLength: {
                        max:20,
                        message: '长度在3到20位之间'
                    },
                }
            },
            alias: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入别名'
                    },
                    stringLength: {
                        max:20,
                        message: '别名最长为20位'
                    },
                    regexp : {
                        regexp : /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]/,
                        message : '请输入字母或者数字'
                    },
                }
            },


        },
    }).on('success.form.bv', function (e) {
        addSubmit();
        //return false;
    });
}

/* 修改标签与分类的form验证 */
function editFormCheck(){
    $("#editForm").bootstrapValidator({
        message: 'This value is not valid.',
        feedbackIcons: {
            valid: 'glyphicon',
            invalid: 'glyphicon ',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入名称'
                    },
                    stringLength: {
                        max:20,
                        message: '长度在3到20位之间'
                    },
                }
            },
            alias: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入别名'
                    },
                    stringLength: {
                        max:20,
                        message: '昵称最长为20位'
                    },
                    regexp : {
                        regexp : /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]/,
                        message : '请输入字母或者数字'
                    },
                }
            },


        },
    })
        .on('success.form.bv', function (e) {
            editSubmit();
            //return false;
        });
}



/* 新增用户的form验证 */
function addFormCheck1(){
    $("#addForm").bootstrapValidator({
        message: 'This value is not valid.',
        feedbackIcons: {
            valid: 'glyphicon',
            invalid: 'glyphicon ',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userLogin: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入用户名'
                    },
                    stringLength: {
                        max:20,
                        min:3,
                        message: '用户名长度在3到20位之间'
                    },
                }
            },
            userNicename: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入昵称'
                    },
                    stringLength: {
                        max:20,
                        min:3,
                        message: '昵称最长为20位'
                    },
                    regexp : {
                        regexp : /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]/,
                        message : '请输入字母或者数字'
                    },
                }
            },
            userPass: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入密码'
                    },
                    stringLength: {
                        max:20,
                        min:6,
                        message: '密码长度在6到20位之间'
                    },
                }
            },
            userEmail: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入邮箱地址'
                    },
                    regexp : {
                        regexp : /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message : '请输入正确的邮箱格式'
                    },

                }
            },
        },
    })
        .on('success.form.bv', function (e) {
            addSubmit();
            //return false;
        });
}
/* 编辑用户的form验证 */
function editFormCheck1(){
    $("#editForm").bootstrapValidator({
        message: 'This value is not valid.',
        feedbackIcons: {
            valid: 'glyphicon',
            invalid: 'glyphicon ',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            userNicename: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入昵称'
                    },
                    stringLength: {
                        max:20,
                        message: '昵称最长为20位'
                    },
                    regexp : {
                        regexp : /(?!^\d+$)(?!^[a-zA-Z]+$)[0-9a-zA-Z]/,
                        message : '请输入字母或者数字'
                    },
                }
            },
            userPass: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入密码'
                    },
                    stringLength: {
                        max:20,
                        min:6,
                        message: '密码长度在6到20位之间'
                    },
                }
            },
            userEmail: {
                message: '',
                validators: {
                    notEmpty: {
                        message: '请输入邮箱地址'
                    },
                    regexp : {
                        regexp : /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/,
                        message : '请输入正确的邮箱格式'
                    },

                }
            },
        },
    })
        .on('success.form.bv', function (e) {
            editSubmit();
            // return false;
        });
}


