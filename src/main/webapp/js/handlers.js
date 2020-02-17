/* Demo Note:  This demo uses a FileProgress class that handles the UI for displaying the file name and percent complete.
The FileProgress class is not part of SWFUpload.
 */

/* **********************
 Event Handlers
 These are my custom event handlers to make my
 web application behave the way I went when SWFUpload
 completes different tasks.  These aren't part of the SWFUpload
 package.  They are part of my application.  Without these none
 of the actions SWFUpload makes will show up in my application.
 ********************** */
function fileQueued(file) {
    try {
        loadingStart();
    } catch (ex) {
        this.debug(ex);
    }

}

function loadingStop() {
    document.getElementById("loading").style.display = "none";
}

function loadingStart() {
    document.getElementById("loading").style.display = "inline";
}

function fileQueueError(file, errorCode, message) {
    try {
        loadingStop();
        switch (errorCode) {
            case SWFUpload.QUEUE_ERROR.FILE_EXCEEDS_SIZE_LIMIT:
                showMessages("无法上传，因为您的图片过大，请上传大小不大于4M的图片。");
                break;
            case SWFUpload.QUEUE_ERROR.ZERO_BYTE_FILE:
                showMessages("不能加载空文件。");
                break;
            case SWFUpload.QUEUE_ERROR.INVALID_FILETYPE:
                showMessages("文件类型错误。");
                break;
            default:
                if (file !== null) {
                    showMessages("上传错误，请重试!");
                }
                break;
        }
    } catch (ex) {
        this.debug(ex);
    }
}

function fileDialogComplete(numFilesSelected, numFilesQueued) {
    try {
        if (numFilesSelected > 0) {
            document.getElementById(this.customSettings.cancelButtonId).disabled = false;
        }

        /* I want auto start the upload and I can do that here */
        this.startUpload();
    } catch (ex) {
        this.debug(ex);
    }
}

function uploadSuccess(file, serverData) {
    try {
        loadingStop();
        if (serverData == 'error') {
            showMessages("上传失败");
        } else if (serverData == 'scaleError') {
            showMessages("无法上传，因为您的图片过于细长，请上传近似于正方形的图片。");
        } else if (serverData == 'typeError') {
            showMessages("上传文件不是有效图片。");
        }
        else if(serverData == 'illegal'){//图片鉴黄，不通过
            showMessages("检测到该图片可能涉及成人图片，建议更换重新上传");
        }
        else {
            froward();
        }
    } catch (ex) {
        this.debug(ex);
    }
}

function uploadError(file, errorCode, message) {
    try {
        loadingStop();
        switch (errorCode) {
            case SWFUpload.UPLOAD_ERROR.HTTP_ERROR:
                showMessages("上传错误: " + "上传文件不是有效图片");
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_FAILED:
                showMessages("上传错误。");
                break;
            case SWFUpload.UPLOAD_ERROR.IO_ERROR:
                showMessages("图片类型错误或网速慢");
                break;
            case SWFUpload.UPLOAD_ERROR.SECURITY_ERROR:
                showMessages("Security Error");
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_LIMIT_EXCEEDED:
                showMessages("Upload limit exceeded。");
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_VALIDATION_FAILED:
                showMessages("文件验证错误，请检查上传的是否是有效图片。");
                break;
            case SWFUpload.UPLOAD_ERROR.FILE_CANCELLED:
                // If there aren't any files left (they were all cancelled) disable
                // the cancel button
                if (this.getStats().files_queued === 0) {
                    document.getElementById(this.customSettings.cancelButtonId).disabled = true;
                }
                showMessages("Cancelled");
                break;
            case SWFUpload.UPLOAD_ERROR.UPLOAD_STOPPED:
                showMessages("Stopped");
                break;
            default:
                showMessages("Unhandled Error: " + errorCode);
                break;
        }
    } catch (ex) {
        this.debug(ex);
    }
}

function uploadComplete(file) {
    loadingStop();
    if (this.getStats().files_queued === 0) {
        document.getElementById(this.customSettings.cancelButtonId).disabled = true;
    }
}

// This event comes from the Queue Plugin
function queueComplete(numFilesUploaded) {
    // var status = document.getElementById("divStatus");
    // status.innerHTML = numFilesUploaded + " file"
    // + (numFilesUploaded === 1 ? "" : "s") + " uploaded.";
}
