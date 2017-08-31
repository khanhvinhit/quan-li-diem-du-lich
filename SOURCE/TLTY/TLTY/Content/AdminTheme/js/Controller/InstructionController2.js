﻿var instruction = {
	init: function () {
		instruction.registerEvents2();
	},
	registerEvents2: function () {

		$('.btn-images').off('click').on('click', function (e) {
			e.preventDefault();
			$('#imagesManage').modal('show');
			$('#instructionID').val($(this).data('id'));
			instruction.LoadImages();
		});

		$('#btnChooImages').off('click').on('click', function (e) {
			e.preventDefault();
			var finder = new CKFinder();
			finder.selectActionFunction = function (url) {
				$('#imageList').append('<div class="xoahinh" style="float:left;"><img src="' + url + '" width="100" height="100" /><a href="#" class="btn-delImage" title="Xóa ảnh"><button type="button" class="close">X</button></a></div>');

				$('.btn-delImage').off('click').on('click', function (e) {
					e.preventDefault();
					$(this).parent().remove();

				});

			};
			finder.popup();
		});

		$('#btnSaveImages').off('click').on('click', function () {
			var images = [];
			var id = $('#instructionID').val();//hid
			$.each($('#imageList img'), function (i, item) {
				images.push($(item).prop('src'));
			})
			$.ajax({
				url: '/Admin/Instructions/SaveImages',
				type: 'POST',
				data: {
					id: id,
					images: JSON.stringify(images)
				},
				dataType: 'json',
				success: function (response) {
					if (response.status) {
						$('#imagesManage').modal('hide');
						$('#imageList').html('');

					}
					else {

					}

					//thong báo
				}
			});
		});

	},
	LoadImages: function () {
		$.ajax({
			url: '/Admin/Instructions/LoadImages',
			type: 'GET',
			data: {
				id: $('#instructionID').val()
			},
			dataType: 'json',
			success: function (response) {
				var data = response.data;
				var html = '';
				$.each(data, function (i, item) {
					html += '<div style="float:left;"><img src="' + item + '" width="100" height="100" /><a href="#" class="btn-delImage" title="Xóa ảnh"><button type="button" class="close">X</button></a></div>'
				});
				$('#imageList').html(html);

				$('.btn-delImage').off('click').on('click', function (e) {
					e.preventDefault();
					$(this).parent().remove();

				});
			}
		});
	}
}
instruction.init();