var ImagePreview = function(file, img, option) {

    this.file = document.getElementById(file);
    this.img = document.getElementById(img);

    this.maxWidth = $(this.img).width();
    this.maxHeight = $(this.img).height();

    this._data = '';
};

ImagePreview.MODE = $.browser.msie ? "filter" : "domfile";

ImagePreview.TRANSPARENT = $.browser.msie ?
	"mhtml:" + document.scripts[document.scripts.length - 1].getAttribute("src", 4) + "!blankImage" :
	"data:image/gif;base64,R0lGODlhAQABAIAAAP///wAAACH5BAEAAAAALAAAAAABAAEAAAICRAEAOw==";

ImagePreview.prototype = {

    _filterProvider: function() {
        this.file.select();
        try {
            return document.selection.createRange().text;
        } finally {
            document.selection.empty();
        }
    },

    _domfileProvider: function() {
        return this.file.files[0].getAsDataURL();
    },

    _getData: function() {

        switch (ImagePreview.MODE) {
            case 'filter':
                return this._filterProvider();
            case 'domfile':
                return this._domfileProvider();
        }
    },

    preview: function() {
        var data = this._getData();
        if (data && this._data != data) {
            this._data = data;
            if (ImagePreview.MODE !== 'filter')
                this._simpleShow();
            else {

                this._filterShow();
            }
        }
    },

    _filterPreload: function() {
        if (!this._preload) {
            var preload = this._preload = document.createElement("div");
            $(preload).css({
                width: '1px',
                height: '1px',
                visibility: 'hidden',
                position: 'absolute',
                left: '-9999px',
                top: '-9999px',
                filter: 'progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod="image")'
            });

            var body = document.body;
            body.insertBefore(preload, body.childNodes[0]);
        }
    },

    _simpleShow: function() { },

    _filterShow: function() {

        this._filterPreload();
        var preload = this._preload,
        data = this._data.replace(/[)'"%]/g, function(s) { return escape(escape(s)); });
        try {
            preload.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = data;
        } catch (e) { this._error("filter error"); return; }

        this.img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod='scale',src=\"" + data + "\")";
        this._imgShow(ImagePreview.TRANSPARENT, preload.offsetWidth, preload.offsetHeight);
    },

    _imgShow: function(src, width, height) {
        var img = this.img, style = img.style,
		ratio = Math.max(0, this.ratio) || Math.min(1,
				Math.max(0, this.maxWidth) / width || 1,
				Math.max(0, this.maxHeight) / height || 1
			);
        //设置预览尺寸
        style.width = Math.round(width * ratio) + "px";
        style.height = Math.round(height * ratio) + "px";
        //设置src
        img.src = src;
    }
};