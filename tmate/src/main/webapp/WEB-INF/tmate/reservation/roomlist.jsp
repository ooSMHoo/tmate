<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/lodging.css?after" type="text/css">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/moment-with-locales.js"></script>



<div class="whole">
	<div class="whole2">
		<div class="border mt-2 mb-4" style="height: 400px; background: black;">

			<div id="carouselExampleIndicators" class="carousel slide h-100" data-bs-ride="carousel">
			  <div class="carousel-indicators" style=" opacity: 0.6; background: gray;">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="5" aria-label="Slide 5"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="6" aria-label="Slide 6"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="7" aria-label="Slide 7"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="8" aria-label="Slide 8"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="9" aria-label="Slide 9"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="10" aria-label="Slide 10"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="11" aria-label="Slide 11"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="https://i.pinimg.com/736x/ad/95/4c/ad954c6198330089cc1ed6b93515d523.jpg" class="d-block w-100">
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="https://i.pinimg.com/736x/ad/95/4c/ad954c6198330089cc1ed6b93515d523.jpg" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="https://i.pinimg.com/736x/ad/95/4c/ad954c6198330089cc1ed6b93515d523.jpg" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="https://i.pinimg.com/736x/ad/95/4c/ad954c6198330089cc1ed6b93515d523.jpg" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="" class="d-block w-100" >
			    </div>
			    <div class="carousel-item">
			      <img src="https://i.pinimg.com/736x/ad/95/4c/ad954c6198330089cc1ed6b93515d523.jpg" class="d-block w-100" alt="객실11">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>


		</div>
		<div class="ms-3">
			<div class="room_name mb-3">
				호텔 이름
			</div>
			<div class="room_grade mb-2">
				평점 + (리뷰수)
			</div>
			<div class="room_place">
				<a href="https://map.kakao.com/link/map/현재숙소,37.402056,127.108212" target='_blank'>위치(누르면 지도 나오게)</a>
			</div>			
			<div class="room_homepage mt-2">
				<a href="">홈페이지 주소(있으면)</a>
			</div>
			
			<form>
				<div class="d-flex mt-3">
					<div>
						<span>예약 날짜</span> 
						<input type="text" id="roomDate" style="text-align: center">
					</div>
					<div class="peopleform">
						<span>숙박인원</span>
						<select name="sel_people">
							<option value="1" selected="selected">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="etc">직접입력</option>
						</select>
						<input type="text" name="input_people" readonly="readonly" style="width: 35px;">명
					</div>
					<div><button>선택</button></div>
				</div>
			</form>


			
		</div>
		
		<div class="room_content px-3 py-2 mt-3">
			<div>
				객실 리스트
			</div>
			<div class="tm_hr my-2"></div>
			
			
			<div class="d-flex room_list">
				<div class="tm_wid35">
					<div style="border: 1px solid; background: #bdd; height: 96%; width: 96%; cursor: pointer;'"
					data-bs-toggle="modal" data-bs-target="#roomInfo" >
					</div>
				</div>
				<div class="tm_wid65 pos_rel">
					<div>
						<div>
							객실 이름
						</div>

					</div>
					<div>
						기준 O명 / 최대 O명
					</div>
					<div>
						<a href="" data-bs-toggle="modal" data-bs-target="#roomInfo">객실 상세 정보 </a>
						<div>
							<div class="modal fade" id="roomInfo" tabindex="-1"
								aria-labelledby="roomInfoLabel" aria-hidden="true">
								<div class="modal-dialog modal-dialog-centered modal-xl">
									<div class="modal-content pos_rel">
										<div class="d-flex">
											<div>
												<h5 class="modal-title" id="reivewWriteLabel">객실 상세 정보</h5>
											</div>
											<div>
												<button type="button" class="btn-close tm_right mt-1 me-1"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
										</div>
										<div class="modal-body d-flex w-100 shadow-sm" style="height: 500px">
											<div class="w-75 h-100 room_slide" style="background: black">


												<div class="slider slider-1">
												    <div class="slides">
												        <div class="active"><img src="data:image/jpeg;base64,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"></div>
														<div><img src="data:image/jpeg;base64,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"></div>
												        <div><img src="data:image/jpeg;base64,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"></div>
												        <div><img src="data:image/jpeg;base64,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"></div>

												    </div>
												    
												    <div class="pages">
												        <div class="active"><img src="data:image/jpeg;base64,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"></div>
												        <div><img src="data:image/jpeg;base64,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"></div>
												        <div><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRgWFhUZGBgaGBgYGhgYGBgYGBgZGBgaGRgYGBgcIS4lHB4rHxgYJjgmKy8xNTU1GiQ7QDs0Py40NTEBDAwMEA8QGhISHjQhISE0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NDQ0NP/AABEIALcBEwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAECAwUGBwj/xAA9EAACAQIEBAQDBgUDAwUAAAABAgADEQQSITEFQVFhBiJxgTKRoRNCUrHR4RRicsHwgpLxI6LSBxUWM8L/xAAYAQEBAQEBAAAAAAAAAAAAAAAAAQIDBP/EABwRAQEAAgMBAQAAAAAAAAAAAAABAhESITFBUf/aAAwDAQACEQMRAD8A8pBkHEirSwiRpRePeM4iBhE1M6Hg1TS05tTNbhVQgwOppU7kR8RhSSLQjg9J31CsfRSfyh9eyfECPUESVYDpUQg1mfj+I28q7xsZjCxssHTC28zTLSWAoO7ZjN9hZLQXCjy3Al1mbSa2zoIHYGwk1vlN+v6w7D8Ot8RtGxNEIt+5/IS7RlPvAq76yyrihmI5Ss1Br9Jd1nStWPeRr0XsDY9P0j0a5DazZepdALakaD0/a8WrI500zzleaxnV4fhYYajf6QfF+GTupEzyXiw8NiDexnX8A4CHArVl8m6Jzfuf5fzkuAeGaY/6tTzIpsAdA7dB2nTKSxuxC8gNSoGwFtgI98Xz0z+c8gFGijYdrDSZ+JBDC9/S35G82Xo20K+vMEdR+0xcapUkA3F9PTlpNcdRN7rA8YgE0evn+WkBoU+8r8Z4o50UfdW/zMEwGKJAmav1o16UCfEBDCne8zsWATpMqMpYoNrKa5vrMk1Ch02h9F7iKBsaLrMM7zexwsJhPvLilKPeREcTQUUUUCiWqZXlliiBVVld5bVlURKkpm74ZpB6yK3wl1B9CdZhCbnh42cEbggj2liPbKLhfItlUaBRpYCFVMIHWxsR0Iv+cy8NXzqtRdM2h7Nzmzgyfb85qSX0ts8cjxfwql8yLkPb4b9xy9pzeNwzp5HFjy6HuDznrrr1mJxPhiOCCoZfwnl3BGxnPLHXjUy364Og9lsJo4FPvGA8X4BUojPQJddcyH4l/UTGocYc2uTvrJvS2Ok4hVJuQwuJmPWL0xrrdr/9so/iWa7Lqen7SPFWNNadRdNXzD1y3lx7ZsBLSF9ZcaY10sAfp1hjIoKFdVqKbjkDBGIF1vf4luOg125zp0yajSs6LyYXE1eFWLuSL5DlHa+kCw1PK9MjzAr7ixv7TT4fhyPtql9C3obj9SLTNqxotVuthYG1/SX4XDtXIF8tNR5321/CvUzn6FR6tY0h5BmNz0UczNDjPG8jJTo6Iq5QNLHqx7nX5zlbtudOjWotRgo8qJ5UWxtYaXPQ3mthqVhqLdx+285HhHE9NWW5PmzGdZgcUHAKuunTedcWMhTUBbym45gH4e4H9pyfEkIc32B35TrXdN20P4hp85xnjhyisy7MtrjlpLn4YevO+N4v7Su7X0vlHoNIPSqlTASecvpvcTm03qOOVltzlNRgZiuSJdQxVtDJYbWYqQwlc3tJ1KgI0lCJrKo3GPcTFqCaVXaZ9QSxFSyV5FZIiUPeKNFAjJiQEsUQqmoJURCHEoYRGaiJtcBezTGE0uEvZpUep+GsYFbI3wPb2blO8wlOy955VgaugM7rwxxn7YZDo67k8x1ll1Szcb70j/nOCVqZ5zTQab3g9W3qZqsxh4xDa6izTlcTwmnXLZlFOoNnUHK39Y2/vO+anrtMTiuCtdlGnO247zllHSVxyoaZ+zqICeq7H0Mu4hgkdEQizElVAJAzEKffQGHVsK4u1SwUaX59tOhvHpVUKPa5ZWUKwU+XPpdfewJ5TM9W+MDh5K0nF1NSg4GUalkFs1v9wmVikC52QEo2ov8AEjH4l/P2hFKicOUuxD1agR12Kpe7HvcFfrNPjWGyPVY2KllIGltbeUdLX+s6SsaB8AKJWQNvncg9MiaeoJb6TR4S4xFF9SroXFgLAqSWC9yIHQw7Gu1MgXakHTLtmCAOARtcFflA/CNRhUdDbJcqb3zA5jYab/tM1Y0q+FIcuj2bIpIN9RlUaHbU84OnDHLDMoYm5JuLAqdQbe02aqFsoYgFkXQ6HQnL9VJ3ip4R11uxynLry5Fr+tzM6XYP/wBtZBexuTtva/WGUUZRsRz8u8qbi1QGwXMF0HS52IhCcdNrOB3IiXRe0Rxpx5Q5PUMN5LFOKtF1bXyEjt6TJ43UUD7Qa36bAdoFhuMkI/UqRb1luVrUkkcksZGsYn3IlV4ZH2zQerSluHfSXZY8UNQBhNPeDObGG0F0vAlVGkzKo1h9drTPcwKSJKJhGmkKKK0UBKJJRGWTAmVQcQdoQ8pcSxKrMIwb2YQcx6R1mmXoOBGZNOk1PDRZcQq3IDGxmD4dxNxYzcp1slRXH3SDJk1HqIewy7W+sak/UTOHE0dA6sNRt0lvDsZnJ2sIlL4PqqPaY3EcSFFk1bkBr9OcNeuHJAvbtp7iA1aaCxFib3zXG2l9BJlSMJ6n3m698osBup1GgPut5W+CygkWzZTcDQFlbPt934T85tYl0FgVvYgGwvvsb+hvB3sFLFL2s1wbXZbEX76W94iVzPEgn8XhQwsS91v5l1AHrqR84Nx7AvTqVlfNkLI4OpHmK5rdQCvtN3GcJTF3KMVemS1M762Dr7eZf9xlPDce2IwzrUF62GcB1IvnUeU39fMfUCUZvB1JxVN1QlVpku2ul6eo73IW0zuDJlxFZkN6TPZnOuQhg6qL7/EO+hm94ewuWoHBJTLUS2tyoPlv3A0+Uz/CeHvhsS4AI+2e4GoAKta3Qa2v2mRtsbshvnsmW2lwWbKWt1tsf5e8mR5Tc2ZlJc3uBoSCvXVtBz0nO+HMawqBHNiXsdNdFA5nledJ4zLUsj0x5yoQBb+UEbi2x217ACaTQD+AACZyVc3bLzG5JtyFiNT3tKMQiAFWS3TN5jYC4J2A95fgqVQJ58xJAFxmDDKBlG12X9I9XCsg1ZvNq9xqb6mwtoO5mK1GDnNipPlYG1lUWt000mXSp5CVYseh1sZs1KTNpbbqLD0HUzOqU/uty+kztqRz2NWzHn7QMamanE6OUzLTebniJAEbS1ahl1OnJvSFtI2aU5bw2jtBaKQ1F0gB4loE0MxG8FYQKjFJlY2WaEYo+WNCaJZZIgRGZVFpW8saQM0lUMIla0sYSphKy3/D2IIadcFJN557w+vkYGei8JrB0ELGtgMLZCxawPKb3CiFoG3P2MxsEpYZeV5rEaZFGlvrMX1RFLEZE73t3EZluCL7a+o5jvBWJJA262/eamHwzMuw020/OTasXEY9UKhswB8vU26fOafE8PahnXUWFyRry6b7WjY7g6sNTa49L9+3yhOHwLHDtSBDeUgG9+W0slS2MXwAhJqOfgVrKOpsLn8h7TC4jVGE4hUzXCV6Tg5b6FgSDpzBG/8ANOh8DKVFRLZWDWZG3D31N+4/IR/FGFWsV0GdAzKNLnylRy6kfKJSztgcPx6Yd3DX+Bw1tiVsc9uV8wP+oxv/AEzUrSqXIy1HYaqdQL6+m8daYOKzol7gBkJsCp056agL7Xmlh1GHVERAKeW2a9iAFDA99A3yEDA8R4X7CutRdum4bUAEetjpOv4nWzqjZsqqqk6gEta9j6d9PzmHxGiuJKhjZEa/TloSeg/tMDxX9rUoK+q4YZsig2LhGytUcdL3Av0MT3RlZJNtypx+hTYkuzNzZAzAf1FRY213J9ZHFcQSqudGB31YXt1yjaY/g9wCjWBBbKR72mjX4Mn8bisOl1UfZ1FCm2XOgZl+ZjLfiY5S1UlPKuZjYDck8r8pm4tgzsVI6gg3E0sdwNFDfaO7kC4ubKOmgnKMj0jcar3N9JixuJ8VTyC+8wgNZr4muXXa3aZjCx7zWPiX1YzaWliE21ldAa6wmptAkgvDfs9INg01h9ZwBLoY+JGsGIl+Ie5lBMCNo1o8aA1opK0UCqNHjEzQYiRtHtHVYRAiMUluWTKQaCKljOy8M4m2hM5Qm2h2+omnwhirAg3H1HqJqMvU8ARa4F9Zp4W7MBbyg63015e057gXEEN1J0Npq47i1OkD5rsdrazGU7al6aeKoWclthboOUPwOKUo2SzFVJ0ICi38205bhVA4oZqzuddEzFQPUDedZg+HolN6aCwZSvzFpn6vxj+H+CnE56+JYsxYhUzN9mij+W9mPrMCvj3w3E2oUvIhQWQAZCQC1yNtRp7Tf8KcVyhqFRsjqwU30y1AApB7NYMp55iOUI4x4XFTEpiQbuEKEaWNzo1+RF2HvOvU3K82Vy5ba3DMlUFigR20LDYn19oDxHhpD3K3uCLjpmBy+h831gnG+MLhhToIw+0Lq722SmhzEH+q1vczrMaA9MMOgN+xmJPrrLbO3B1MNZ/hJ1GzZSCDct21EyvEVTMqqFa+e97kABSwG9t9R722E6Ti1MhjvzNhcCxFj7akW62Ok5XjAzMzc7g6Cw6Ef50MXxqegvEVZqWHXJuXUHuN2HvYj3h3h7FU69PISCtrFG3UblbHYXJPvAvGCA4RQNGDqRqBrY9feYvBPDeJqKrIya6jOLkD21kxk/dGU5TTrEw2GwC53byrfIl8zuTsAOfrLvCOGdzXxlUZWrPe3RV0AHoLD2lXDPBSIwqYp85GyLYLf03MP45xYBLIpVF0FudthblLrXfrMjL4ziS7kWsu3P8A5vM9MIp+IadNJQcQSS72HPKDc+h03MFxPGS11VCD1M5Xuu86jP4q4uQu0wyus0cUxtAUXWbnjFOg1hCpJ06V5a62EsSopUywevibyjEObykGCJk3jER0UmWZOphVNo9pMiNaA2WNJxQBhEFklEdZoMFjx2EYiBJJeFuIOkvUwK6lK8GVmQ3U2mihkWpgypY2/DvFGzAMA3fnPTeCcOoVDmsLnqZ43hkZTdTadx4e4gwFs9m3B21ipHor8JC+ZFsR8vpvKaOPyE3+X95DAeIQAA483UbW63h2IpJVQtTsT32/aY1+Lv8AWHxnhGHxLfaJV+xrhbZxazD8LqdGX1mc3BOJgZEroyHmHqLYf0hrfKHYjhuVrtoTfkCAPWRDulsjkdNSPz0tHKnGKaHgQqv2lV877kW0vz/53nUeHseHoFC12pnIeug0v7QN+I1UpHP5rjQj9Jyvh6p9nWqOzm9TXL6btbpJcr9WYzTssbQDg356f5echxfCmxa2wI9hz/ftOrweIDqNb6X/AFmRx2gQCwBIsdtzcW/vJctrMXm3iPiBamqWv5h7EdfrN/wlxUqhsRcDTfUc7C19JyXFHIcqDsd7D3uJqcIwbqM6m3PQ7eg6RPFsddiMdUKl7ZhuSDZrWseWm8wsVVzsMoysBbKSf+0E2ttrJ4fibXKNY8jrrf3vDVpIgzhNSOgufeLdpMdegWQItjYE6sepmXiKB5AKOrHf23hOJqszWzInvmb6Xt9IFXpom7u57WH1N5mY/Wrl8jProl/vP6eUfrGpFb/Ao9bmGrktfI3u36CA4nGouyD/AHGdJGLRD11H3R7aQGrXVtBoeh1HzlD8QB+4v1MpOKY7WHoLTSLXw7fe8o7yICD+b6CMj30bUflHZLQpFye3pEIgJMLMhrRrSVo4ECGSKSimgHeSEiVkwsCxEjVZJTykWSBWglyjSMEjqpgRV9YSDcSh0joDaNi1aloXhcYVOkCp02c2UEnoBczRo8JyeatUWkOh8zn0Rf7yxK9B8M4k1VF1zWnX4Z1B1uDt0/5nNeAalErlphmAO72F/wDSJ6EcMpGwHewmuM9YuTLr8MV7lGsTy5H1Eow3BjT1NibakC9/S+02BRZdnPyl9SmWW15LiTJztXB572tp3ub95l4ngRzBhe9raWAtcm31M3v4Z6ecpSFy1/i+Iaa9vSGpSz7rbluLa76Ccri6TLTk+HDICrHLYkdPlD8ZUR0PnF7HfQHrLeK8GYKWQ3AF8p167GcTxHGogIJsSpa3poRpzubWk1qeNycvK5fiuEU1zl8xJsLczff+82UpmnTvY2H3Ru3a1t5teGPDJVBWrrZ3GYJ+AHUD1l/EaPm08tuZAPyB5xcbPU5S9Ry2H4cWfOyhFYa3+PN0NiJtYyndBlQaaXK/WNhqGt/M5F/M9x62AhwZ25kDkAR/cGMZtMrpzowpGvlv/rH5CVvhXO6g/wCof/oCdE+DZt39mUfv/aTXh1t190JH01E3xY5ONx65F1Rh3ygj52nK4h1Y6MPcWnfcfQoDkex6MAPrcD6icbXxYvlq09epT6jmR6GWQ2yxQPY+kmqQ5aNM6qGH9Bv80bX6y1cOG2dW7HyN8jp9Y0sAKJcmot8pdUwbrqVNutv7yoGFMBJgRBekcaQqJEYCTMaA0Ue0UIEyEaGE0ad/lJIuaWYYWNoAFT4pcptGxKWaTUXgWUwG5fKTNNQbX+YlWHaxluTM14Fj4ZbXzfQxqWRfulj30HyEtU8pbSoZjYDWF0o/inGikIOiDL8zuZcmARRnrsVB1CDWo/cA/CP5j9YYuGKOFRM9Y7C11Tv0LfQTQXD4fDf9TEn7esdcl7oD3/EfpLIzW14CxLlz9lh/s6Q+/qb/ANVRviPYT1jDVAQNQfSeI1uJV6uVqztSQ2NPD0tHcctPur/M3sJ1HCPFIpACpZBewANwD+HMdXbqdhNSzWnOz69KaQarMFfEKMmbMAvXv0HUyjGcbSmheocoGy878lA5t16TXH9Z7b1SkD1+do9MBdh9ZyPDfE5e7sMqZsqDrbf/AD1m3R4wja3Ekxla3YOxOKsOQHecBxLC0jiUqrQDOGuTyJ622J7zrq+MpncgzIxfEqaX2jiSiKuOLAXBBMzKyKTqdb+8xOK+IwpIWc7/APIGaotzpmElk+td/Hp2G4eGGgljcOtyhnAKiuinsJsmiJeMjHKuYbCdoM9EjadHiKNpmYpbRcVlcX4mwqOhD+U/iA/MTzerSqUiVNnS+l/Mh9Pwn5Geh+KcTdWC722nCYeo2v1B1DDoRMVqRTTpodVORujHy+z8vf5y91+64ytybr+o7x6lBSMye6c17jqJVSrsotuv4WF1+R29pGzqzodGK+hIBk3xTn75klroRlZCO6tcD2Iv9ZW1MXtc/IfrAY1GO7H5yqWstpTzmVOTFaLnJkXmg0UWWKAZgqQ1g/2ZzG0PpUsoLcpVg0zMSYUE9G+8DzWa01MdUANhMphdplKNwyXM0f4SUYWjcibJsFmlgCnhte8tw6nPkTf7z8lHOx5DvGosXfIvPf8AftJYxspFNPhJGY83P6doKOq4xaaZaQ1bTNbzOevZeg5zPcij5nAetyDeZaZ6sPvP22EJxtUUhp8dgB/IP/L8pj0dWueWvvG2dD6b5QzuxLtq7k3bXZVPU/QQOlmruSxyIgux5Io+6vc/Uy2pSZwANSTp6nnJpSVmFEG1On56rj7xG/r0A6xO0s06DgtUm1VvIigiih5Bfiqt6desC4hi2xLjUhBoo9TvbmxlXEMYSMgGW4FwNkQfAg9Nz3MqwpK3f8Km39R0H539pbfhjj9F4nG2YKhsiDIo5D8TdyTeRHE3AAuR/eZpMQ7zO2+MaL8Ve+jG0Eq4523JlLaR9DHKpxgfGMTrM7nNfE07LM1qdzeNmnc+DvFeTKjm3K89RwXF0dQQwnzwk1cBxeqmiubTcy/WMsPx7ZjuIovMTleNceQCwIv0nBYrjVV93mP/ABTM4JJMtz/EmDbx1VnOa+nLqICaQJzDf7w/uIUXuIPnysD/AJac9umgFUFGuNCIqqBlzqLfiXoeo7QzHINxsdRA6LlTcehHIjmJQIBC6HQ+x6R8Th7aj4TqP0PpI0TAsrJygLraaJa8oqpcTIGTUy4mUqsspwJRSOeKBqPUsgEVHRCZTUe9pfiHypaaVjVrsxltPC2GaW4JdyYVXtbTaEPhCNDHeoztYayuihyk8uvKWJWX4V5jU8/+IXYmnZPKu5+Juv8AKO0KpUwGzHVuX8vc94Amg036y6nVsDBpncTq3cjvEqWX1lOIW7w0UzoBAN4e2VCx3PlXr3MZ6IorryIc/wAzn4F9B8RipMC4A+GmPm3/AD+Ubiz51GtwOfUncwzewVAlr33ve8LqvkVU5nzH8lH+dYNhN/aWucxud5lpAJzjqb7yKgg6xnGb4YUmY3sJMpbURkOXeOqG9+UCTvddYCVudIRWOYaQZGymEpnFvWXYJdCYnS+snhNoAuIeNh05yOJHm94Xh08sIkryWJGl4PUOuksZtIVUrlkt+E/Q/vIAWltBLA9x+8qfSaRfh6oPlOx+h6xNSymQoDWTeprY+0AZ2sbQiit1lBGt5dhmvMgddCYzDpFiNGiRpoV2il9xFALoILfKS4jtbtFFMr8D4QeUyR2iimki2p/9ZtA8GtzFFB9HVXyiV0WJ1iimV+mrppm6QnDvdc3PYRRTQbFNkUINzqx9dhHqN5I0UlIqwZ1v2k6i3NxtFFIJZs2kr+HWKKA7jNrJUmO0UUCqsMusqormN4ooDs9jaTwpiigDY5LN7y9PhiihEKIzGKs3mtFFAm5tIvqIooEKWhkiLm8UUCiq1zpJ4drRRTSKsUbm8ircoooD5Y8UUD//2Q=="></div>
												        <div><img src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBUSFRIRERISEREREhISERESERIREREQGBQZGRgUGBgcIS4lHB4rHxgYJjgmKy8xNTU3GiQ7QDszPy40NTEBDAwMEA8QGBIRGDEhGB00MTQxNDQxNDE0NDE0NDExNDQ0MTE0NDQxMTQxNDExNDQ/ND80NDE0NDExNDQ0MTQxMf/AABEIAMIBAwMBIgACEQEDEQH/xAAcAAABBQEBAQAAAAAAAAAAAAAEAAECAwUGBwj/xAA3EAACAQMDAgUCBQMEAQUAAAABAgADBBEFEiExUQYTIkFhFHEygZGhwUKx8BUjUuFiBxYzctH/xAAXAQEBAQEAAAAAAAAAAAAAAAAAAQID/8QAGxEBAQEBAQEBAQAAAAAAAAAAAAERAiExMhL/2gAMAwEAAhEDEQA/AOprtxMwt6odcNwZk7/VNRa6XTm4h1Q8TM01uIfUPEqM65MBqCGXBgjwgMpHFISRaOKg7ys0woiI0ZMVBH8wQio0I3kS/eI28SKHNCRNvCdwkd4gDG3kTbwzcI24QA/Ii+nhe4RZEAM25kTbmHcRcQuAfIMfyTDRiOAIMAmiZKnSORDMCOgGYTFqoYPdIcTQUSm4HEDCdGlZDfM02QStkEumMxy3zB3dvmazoIO6CBlNUb5kDWaaDUxKzSEjQLz2ihflCKGXXXJ4mQW9U1bk8GYrN6pI6V0umtxNCo3Ey9MbgQ+o3EqA6xgzy2o0pcwjOrnrA2cwy4EEtNPrXFRlRkp00AzUZSxJPsBkRuJmkrmTDnvNX/24wHprq57PT2Z/MHj9Jn3Vm9I4dCvY9Vb7GJ1Kl5sVeae8XmnvBqtQL1MrNwME54HU9pUwWax7xvPPeZTakmcbu379P4l5rAYzxnp9pNi/zR3nnvF9Q3eUU+YTa2T1iVpIz7epHCj4LHjMGIfUN3i+paabeFrgjIqUlb/gdzY/MTFrUnps6VF2OhwQDkYxkHMmri83bRvrDAy0bdKg4Xhk1vDM7dJK0DS+sk6d5yJm7pOm3Igb63MpuLriUI/EHum4gJrsSBuxAGaVs0oPe7Epe6HeAs0pcyA5rod5A3Q7zLcypnhpr/VDvFMXzIoHo103BmGW9U2bw8GYZPqmY06bTG4EPqNxMvTW4ENqvxNIGqNKy0rd+Y2+EUuuYRSylMFODvfPz+GRQZhVCnlXUdRhlHcnIP8AH6SdfF4/SFtqbH2GR8CadK6Sovl1FDK3BHtz7icxeIQ/PBA5A/uCORNnR03FSxPTODkN8c+85yu/XMzWRq2ispqBCSo2sjdcr7j9/wBvmcIivUtHpox87zWd1/q2ZOB39gMfE9lvsMCOMe885sKdOjXvXqBlL1qdFM9MsDjb/nuI1yY1xZu6MuMl6dPA9w44znsOY53rWtaTH/dND1BieXyeo9ujTXsLsF6Z9KAvlvcBER94/YfqIVYad5l/TulQimKOc8kbyMcZ+ciVXQaLoCnd5xOynwQDtLnsSPadA1wtNQqKEX2UbVGJK2QBCD1IMy73CZwee/P754k1JNq6tqJyAAMn3znHzMDxG2ag7imm7/7cn+RNWwTzOV6E4Ln+Jjaihd3buxx8AcAfpia5O8njIaQhjWxkPpjNuQcSSy76YyQoGBXHTqJb5BjpQORAMTpB7rpDUo8Si5onEDJaVMYS9EypqRgDMZU8JakZU9IwAnMHYwx6Rg70jDSjMUn5RjyK9CvTwZgsfVNq+PEwifVMxp0enHgQqs3EC09uBCK7cTSAqj8yIeU1W5kA0A+2ea1hgOM9GwB27fzMG3ea9tUyRzjkSX4z8q260x2rIyBCo/EzdNvuox7+4mmtp5YyMfkMQHUtdpWoVqrhEYhQfmW2niG3rr6Kit19iM/bM5t22rVqKxKggsAcjIzx8TnNes1urauKaeumQ68DLMp9j39OPzgmp+O7a3qFVWo7AkHYiqAB1OXIyJq+H9Rp3CVKtuxZHJ3I67XR+Tgj7EY+8vwea2SVHdqSIUNRgFODlQ7KGIHwCwnrdAJTZKKryE6/x+8zLbTUWpvRFDErtyORk847dWkNb8Q0LOoGrF2qFCUSmm4hOhY+w6HqfYyS6tmOgWqCcDqM5xK76ydkbYFJI6NMrw54itrok0XO/G5ldGR8dOp4OPjpDb/xNbU3Wk1VS7nACndg9OcdISXPiWlWXk0iahIz1DEen4mHWIJY9yT+82NWuSaR6Agg4yO/95zD3Bm+Z4z11t9EMBI4EDNwY31Jm2dHYEcKIALkyYuYQcFElTUZgQuJZTueRC61lWUXK8SS1eINc1sCFDuglbIJU1zIm4hNSZBKnSM1wJS9yIQzoJSyCM9yJQ10Iai3YIpT9SIpFddfngzBdvVNu/PBnPu3qmY06KwbiE124gOnngQmu3E0gKoZVmO5leZBfTfmH0av+cTKVsS6nXx/ghKWo0Wu3FN6YNOlyzOuQxx7TS0uoluPLChUbkYBO3j7fEH80/iVlzghsgH8+8lQsfNBDMzE++3AB+Jz68b59jkNf8J3NS4NxZg1EdyyVEqIhTJJIbLAggk9Mzd8FaNcWTVBcFBTamgUI+4BlzndwOef+5v2Ph90LOahfaPQudm0dgQefzgHixilsa7+YNlRdwQh12liudy+2OfjIi9WzCczdba3ABViOGPB6fbE4LxV4cvalZ7ugodTURqSo4NRFRQBuVsAjIzwT16SdbxDSqUwqeYzsBtVVORx36duZ3VO0KqtEeZjao37toJ9+SQSeB+vWTm2NdcyuQ8CaM9ktSpdL5e5dq03K7jkgsxAJwPSBzNTU9Mp3Gai00Rz+AhQDx/Ue0KqaA6vu8wuvOQ+X4+55lVdaqkYdNhO0gJggY6jJ6y7tZzIotmc0wlQNlMruI/EB0PWQa1EvXj+3Oc/vHLidZMjlfaDa2EgbWGlxIFhKgUWokxbCX7hHDwKPphJ07cZEu3ySNzAIWlxBrqhxNFDxB7k8SNMV7aVtbw52ErZpUwA1vKXtoexkHMKy3tZQ9rNRzKWgZ/0kUOikVu6j0M51m9U6HUuhnM1G9X5zLTo9PPAhFweIHpzcCF1+ktADmMojtJ01zJCosspNMk8TUo2u6altp3xKxawrZHUN7DHQYB/7/OF6bq4wNzKoGBknIJ7AcTTvLJQvQczkb+zKP5iAHaD6OeO+M/l+vxiY6jXNeg291kfcQLU9xVlUZDDaRsVsr2PHSY1hqLOAN65A9SdDnjI/ia9te+xx/E52Ny45zStCW3rNWWmoLHK4BbYOOFH9PIzxOytnx62Az32qD/bMpe6C8hcmZuoanUTlKe4E/t9okq3rWlfXhGSNv58fp3nNVdR807txIGehOB+Uz9TvqhU78nJ2hSQB/4n4z0z9vnL2FB6iEtwcdTuVg3/AJjnB+eZ0jN+NWnas49JyPmSOnPDvCTGohVyCyMVPIJ+Ok6tbMH2nVxsrhf9NeMdLed59EO0X0Q7QZXB/wClvENLed79EO0X0Q7QZXCDTHk6enOCJ3H0Q7RCxHaDK5hbRpRc2LkcTsBZ/ERsviD15+dKqRjpL9p6B9CO0X0I7R4ZXnraRU7SttHqdp6N9CO0X0I7R4ZXmb6PU7Sp9Gq9p6gbEdpH6Ado8PXlv+j1e0U9S+gHaKPD153qh4M5iqfVOh1R+DOXuH5mHV0OnPwJoVG4nO2VziaK3OZReBkzRtKGZn2wyZ0FjT6RIxehVrazXoURKKAhSNGDC8VVPLplh1BXGMk9fYCc9RrJWACH1KQQGyGBHsc/ebXjNN1JgOpKjOcYG7mebXVwlOoUaoaXqO11JYDp16YmemuXbUtPplmcgpVIw2M4+4OITaaO5LE1Tt4AAwSMTB06nd1Sr07qiUXHqp5ORjqQf7TqtNovuIduSMgrkA/kTMtBtV0yth2o1OdvpQ9MjBmUFvGC70w4BDY4Ge/8zuPLyME4I94Le3CoMAqCTj1cDMI4lNLqbmqVcHgYySNuMftkTZp/7aEkgnGZTqGpUEy1SsrBf6QeMzktb15qgCU1dEcYDDgd/wBJYW60vC2sFb80zuIqKe3BByDn3nsttgqDPnzSaP0lajcO2SXAC54w3BPx1nvOl1sqOcgjibnxi/WiEEfaI4khIqIQR9gko8COwRbBJRQI7BFsElFAjsEWwSUUCOwRtgksxZgR2CNtkooENojx4oHgFzqO4dZlO+YqVBjC0tfiWJappOZpW7mVpaw+2t5WWlYDpOhtDMayp4m1bLGjTpNCA0Fpy8GNHH/+otZhbkU8h2dAD8ZyZ5jQ016gNWsjFc46kH7jPWes+MLdalCoHLKo9RZTgjHvPONKuEG5DU8xR0yCMCZrcPp1pc2W65tX30QM1KRPqKn22+5+Z6X4V1hLmmtVRjd7D2I6gzlbW8pogQVAlRhkqcHg9AYd4Su1RqlLpsbIGAOG5B+3WZsV35cY594Am2oGBXgMVOec4PWOlfd1lNSoqKxTHXOPmQZPiGjbohaolPA9WWAzx7zzPXdWSr/8FBgqj8QGCfvidTdBLyqxuiRTpttSmCQhPc95TfVUtX9NNTTK9pqQcXp9GvXYY3qi87myFwPbM+h/DtbNOnzzsXP3xPIKXihKn+2KaorHGce2Z6F4a1JWARcjbwAfcTcYru1eSDQSnVyJaHjFEbo+6UB4++TDV26LdKd8W6MF26NulW+LfBq3dFulW+LdBqzdFulW6LdAs3RbpXujboFu6KVbopR42LAD2iFAD2nQV7aAvRnPVArREJpU4TTtpetvLqYnbKJq0EmfRTE0bdpdMGIssxIoY9Z8KTGpjlPGb7qT0updSoGcZnl1HRLlBuUqqj8R3Dj9J2XiS88y4Vcj0/8ALp+kz6umKzAPXKJUP4QDlj2UQ1HFJb1qlTZTD1HznIBznv8AE6XRb2otVUqqyVlUo4YYyvUH/O89E8O6Xb267KZ3FzkscFicfEz/ABTou50u0ADUztfHR6Z45+RIoi01AnaN3I64+0Wq3exG2nlufv3nLfV+W6YGQSRkSN/eltiNjLcZ/wCJliMRK929RmpU3dVYgEL6ev8A3Ff3l3UxTq03p8cEIQSRPUNHp07ejTRyFLDhm4yx5mbrtW6pnfTWnVp/C+pOx+RJquM8P6U6OHe34xkO4xj5wehmhT1Pyq4YsVww6Hjr0h9td3DioaquBgDpxnsJz11ZEvuII98E9BNI9x0m6DorBgdwBmok8a0HxCbR1RizU265yQk9a066FRQwOQRkS1B2I8QMlIYjHj4ixGmGijxQYaLEeLMBYixHzFmFNiLEfIizAbEUfMUDiLhICyczTriB7OZlUqNOXGnJ0lk3EAbZLaUW2Sp8GBo29LIyYPqJ9LAH2g99rqUdquduffHEwdV8T01O3OQw6gE4hHF69bt5m7rg9QcE/E6HRtJF2hJLUnVcKQQSoI64xMOvqSVHKA9TkHpzO+8LL6Ouft3+YVGw0Y0Ep0qZwig+ZUY5qOfv3M3GRKiGnwRtKkdfaA3thXq8LW8pc8hV9RXtuzxJWeltTIIqHjcWJyc5OfeB57rNqKTMh9IDH/BM22YebSG4OoYE5Pq6zv8Axfo61ENQD1KMkezD3nn/AIasBXuOPStM5PcnMK9JuqKVEVGdVJA4IBP5AyNpplOmcCtUx/wNT0g/AkLrT1qYDE5I24wMn/8AITYaUiFcDIA4LMSc9oQReUQEGMbR7zitXojccY59+mBO7v0JRlQcgfeeQa1qzq5pkc7sZmoy29N0YXDqgOFTBc/Paek2Fv5YCoeFAHWcboV8lKluzgBcs3zN+hrlNKS1XdQrAHJMmrjqqVfjmW+fMDT9WSsi1KZDKw4IljXcuo2/Pi+omF9XHF3A3fPjGvMf6mRa6MDZFxH88TB+rMX1RlG754jG4mCboxvqj8xo3TcRvqZhm6Mj9UfmTRvfVR5gfUtFGiTiDlOekMcCV+WJloyKe0Z1l6JHZRACOYyLyIXtHzG2D5gRr6ctTBIB+8zrrQ0P9C8fE2ab46ZknYEQOJr6Gm7OwY+03dFp+UjE5AA6noBCqpweBC7NMg5mRn6Tqwqo4yVKtyx44PQj26g/t3kqWsqUWoGBpio9KoTnKOrlM47ZH7iaCWnB3c59uspXTU2lAi4cln9C457iFZ1TWaL71p1FqBRtqU0YF0OODj85xWh0GtalaotOpUV9xVBjdnOeTPRU0mnTztRV45IUCC21uu4ggczQ51dZWjw9Ou1VgWKpSqOm9udu/BAA4H5TStdR2+UrU3DPuZsKzBDjpnH95tCyHQqOwPv+snTtBxx0z1mRktduKrHY703Xjb7HHuDOdv8ARRUcuUHJ9xzO8FsAxb4gFekM9JpHLVvCyVE2+sA87VYgGUXXgpKiruaoVAACb2wPyna22BwekOSmuIHNeHdCW2Tahfb2ZicTV2Q6rUAGBBcwivbHVZMmIQJASLiWAyDwKsRSUUCOIxEnI5gRxGxJExiY1TYiizFCNB1lQX7S5pXiFTRY7LHQRyIVXtjFJLEWIRFVlm2MoloEAGqgzCrQcRqqSvn2MAwsR05iRyfbH3lKZOM8H9jLqtTC/MKFu6xPA6QRF5EtdcmIr0MygkofYySKYxUkDEgzbfck/eFWV3wIC/MJFQtByvM0isJL1J6SSLJ4gUFTF5cvxFiEUeXEKcIxGAhUNkZkl2IxECjb8CMU+IRtEWBAGNOLy4ScSBgUbIxSX5jEwKPLil0UC95ARRQLUkmiigVx4ooElk4ooRVUlK9RFFJQdSg1z1EUUqoLGqRRQL6H4ZDHMaKAm6SkRRQLBJRRQhRoooCjxRQHiMaKFNGMUUIiZExRQFGMUUKaKKKB/9k="></div>
												    </div>
												    
												    <div class="side-btns">
												        <div><div class="slider-prenext">&lt;</div></div>
												        <div><div class="slider-prenext">&gt;</div></div>
												    </div>
												</div>
													
													
													
													

											</div>
											<div class="w-25">
												<div class="room_detail_modal shadow-sm" style="height: 85%; overflow-y: auto;">
												
													<div>
														<div>객실 이름</div>
													</div>
													<div>
														<div>숙소 공용 시설 / 서비스</div>
														<div><i class="fa-solid fa-square-parking"></i>주차장 L</div>
														<div><i class="fa-solid fa-mug-saucer"></i>카페 L</div>
														<div><i class="fa-solid fa-fire-burner"></i>바베큐L</div>
														<div><i class="fa-solid fa-utensils"></i>조식 L</div>
														<div><i class="fa-solid fa-dog"></i>반려견 동반 가능 / 불가 L</div>
														<div><i class="fa-solid fa-bowl-food"></i>조리 가능 / 불가 L</div>
													</div>													
													<div>
														<div>객실 정원</div>
														<div><i class="fa-solid fa-person-circle-check"></i>적정인원 : X명</div>
														<div><i class="fa-solid fa-person-circle-exclamation"></i>최대인원 : X명</div>
													</div>
													<div>
														<div>객실 구성</div>
														<div><i class="fa-solid fa-bed"></i>침대 O개</div>
														<div><i class="fa-solid fa-shower"></i>샤워실</div>
														<div><i class="fa-solid fa-kitchen-set"></i>주방r</div>
														<div><i class="fa-solid fa-person-swimming"></i>수영장r</div>
													</div>
													<div>
														<div>욕실 및 세면 도구</div>
														<div><i class="fa-solid fa-bath"></i>욕조r</div>
														<div><i class="fa-solid fa-hands-bubbles"></i>세면 도구r</div>
														<div><i class="fa-solid fa-grip-lines"></i>타월</div>
														<div><i class="fa-solid fa-fan"></i>헤어드라이기 L</div>
													</div>
													<div>
														<div>편의 시설/용품</div>
														<div><i class="fa-solid fa-wifi"></i>무료 Wi-Fi L</div>
														<div><i class="fa-solid fa-tv"></i>넷플릭스r</div>
														<div><i class="fa-solid fa-computer"></i>컴퓨터r</div>
														<div><i class="fa-solid fa-socks"></i>세탁기r</div>
														<div><i class="fa-brands fa-hotjar"></i>난방</div>
														<div><i class="fa-solid fa-bolt"></i>전자레인지</div>
														<div><i class="fa-regular fa-snowflake"></i>냉장고 L</div>
														<div><i class="fa-solid fa-wind"></i>에어컨 L</div>
													</div>
													<div>
														<div>객실 전망</div>
														<div><i class="fa-solid fa-water"></i>바다뷰r</div>
														<div><i class="fa-solid fa-mountain-city"></i>도시뷰r</div>
													</div>
													<div>
														<div>안전 및 보안 시설</div>
														<div><i class="fa-solid fa-land-mine-on"></i>화재 경보기</div>
														<div><i class="fa-solid fa-fire-extinguisher"></i>소화기</div>
														<div><i class="fa-solid fa-building-shield"></i>완강기</div>
													</div>
												</div>
												<div class="pos_rel" style="height: 15%;">
													<div class="lodg_price">1박(평일) / OOO,OOO원</div>
												</div>
											</div>
										</div>
										<div class="w-100" style="height: 120px">
											<div style="width: 95%; height: 80%;">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

					</div>
					<div class="lodg_price">
						<div>가격 <span class="price_won">원</span></div>
						<div><button onclick="goReservation()">예약하기</button></div>
					</div>
				</div>
			</div>
			<div>
				
			</div>
			
		</div>
				
		<div class="room_content px-3 py-2 mt-2">
			편의시설 및 서비스
			<div class="tm_hr my-2"></div>
			<div class="d-flex">
					<div class="tm-text-cen">
						<div><i class="fa-solid fa-wifi"></i></div>
						<div>와이파이</div>
					</div>
					<div class="tm-text-cen">
						<div><i class="fa-solid fa-snowflake"></i></div>
						<div>에어컨</div>
					</div>
			</div>
			
		</div>	
		
			
		
		<div class="room_content px-3 py-2 mt-2">
			숙소 이용 규칙
			<div class="tm_hr my-2"></div>
			<div>
				체크인 시간 OO시
				체크아웃 시간 OO시
			</div>
			<div>
				~하시면 안 됩니다.
			</div>
		</div>
		
		<div class="room_content px-3 py-2 mt-2">
			기타 확인사항
			<div class="tm_hr my-2"></div>
			<div>
				~는 언제까지, OO은 어디에 구비
			</div>
		</div>
		
		<div class="room_content px-3 py-2 mt-2">
			주변 가볼만한 곳
			<div class="tm_hr my-2"></div>
			<div>
				~~~가 있습니다.
			</div>
			
			
			<div class="tm_hr mt-2"></div>
			
			
			
			<div>
					<button type="button" class="w-100 mt-2" style="border: none; background: none;" data-bs-toggle="modal" data-bs-target="#hostInfo">
					 	<div>
						 	<div class="host_modal">
						 		호스트 정보
								 	<span>
								 		&gt;
								 	</span> 
						 	</div>
					 	</div>
					</button>
					
					
					<div class="modal fade" id="hostInfo" tabindex="-1" aria-labelledby="hostInfoLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered modal-lg">
					    <div class="modal-content pos_rel">
					      <div class="d-flex">
					      	<div>
						        <h5 class="modal-title" id="reivewWriteLabel">호스트 정보</h5>
					      	</div>
					      	<div>
						        <button type="button" class="btn-close tm_right mt-1 me-1" data-bs-dismiss="modal" aria-label="Close"></button>
					     	</div>
					     </div>
					      <div class="modal-body d-flex p-4 w-100" id="hostmodal">
							<div class="tm_wid30 hostmodals">
								<div>대표자명</div>
								<div>상호명</div>
								<div>사업자 주소</div>
								<div>이메일 주소</div>
								<div>연락처</div>
								<div>사업자등록번호</div>
							</div>
							<div class="tm_wid70 hostmodals">
								<div>OOO</div>
								<div>OOO</div>
								<div>OO시 OO구 OO동 OO로</div>
								<div>OOOOO@OOOO.OOO</div>
								<div>OOO-OOOO-OOOO</div>
								<div>OO-OOO-OOOO</div>
							</div>
					      </div>
					    </div>
					  </div>
					</div>
			</div>
			
			
			
			
		</div>
		
		
		<div class="room_content px-3 py-2 mt-2">
			리뷰
			
			<div class="tm_hr mt-2"></div>
			
			
						<div class="pos_rel">
			
							<button type="button" class="mt-2 tm_right" data-bs-toggle="modal" data-bs-target="#reivewWrite">
							 	<div>
								 	<div class="host_modal">
								 		리뷰작성
								 	</div>
							 	</div>
							</button>
							
							
							<div class="modal fade" id="reivewWrite" tabindex="-1" aria-labelledby="reivewWriteLabel" aria-hidden="true">
							  <div class="modal-dialog modal-dialog-centered modal-lg">
							    <div class="modal-content pos_rel">
							      <div class="d-flex">
							      	<div>
								        <h5 class="modal-title" id="reivewWriteLabel">리뷰 작성</h5>
							      	</div>
							      	<div>
								        <button type="button" class="btn-close tm_right mt-1 me-1" data-bs-dismiss="modal" aria-label="Close"></button>
							      	</div>
							      </div>
							      
									<form class="w-75" name="reviewForm">
										<div class="mt-3">
											<div class="d-flex">
											
												<div class="star-rating">
												  <input type="radio" id="5-stars" name="rating" value="5">
												 	 <label for="5-stars" class="star">&#9733;</label>
												  <input type="radio" id="4-stars" name="rating" value="4">
												  	<label for="4-stars" class="star">&#9733;</label>
												  <input type="radio" id="3-stars" name="rating" value="3">
												  	<label for="3-stars" class="star">&#9733;</label>
												  <input type="radio" id="2-stars" name="rating" value="2">
												  	<label for="2-stars" class="star">&#9733;</label>
												  <input type="radio" id="1-star" name="rating" value="1">
												 	 <label for="1-star" class="star">&#9733;</label>
												</div>
												<div>
													<span id="rating_result"></span>점
													<input type="hidden" name="reviewrating">
												</div>
											</div>
											<div>
											  <textarea class="w-100 mt-3" style="resize: none; height: 150px;"></textarea>
											</div>
											<div class="mt-2 mb-3 host_modal">
												<button type="button" onclick=""> 작성하기 </button>
											</div>
										</div>
									</form>
									
							      </div>
							    </div>
							  </div>
						</div>
					

			
			<div class="tm-text-cen">
				<div class="star-ratings">
					<div class="star-ratings-fill" style="{ width: ratingToPercent + '%' }">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
					<div class="star-ratings-base">
						<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
					</div>
				</div>
				<div>평점</div>
			</div>
			
			
			<div>
				관심 있는 키워드를 선택해서 후기를 살펴보세요.
				<ul class="d-flex list-no review-cate mt-2">
					<li>청결 +</li> <!-- (깔끔, 깨끗, 청결, 위생, 더러, 더럽) -->
					<li>서비스 +</li> <!--(친절, 직원, 매너, 서비스) -->
					<li>위치 +</li> <!--(근처, 위치)-->
					<li>소음 +</li> <!--(조용, 시끄러움, 소음) -->
					<li>편안함 +</li> <!--(편안, 편한, 쉼) -->
					<li>난/냉방 +</li> <!--(난방 ,냉방) -->
				</ul>
			</div>
			<div class="mt-3">
				<div class="d-flex">
					<div style="width: 8%;">
						<div>
							<i class="fa-solid fa-user"></i>
						</div>
						<div>
							OOO 님
						</div>
					</div>
					<div class=" "style="width: 92%;">
						<div>
							리뷰 제목
						</div>
						<div class="d-flex">
								<div class="star-ratings">
									<div class="star-ratings-fill" style="{ width: ratingToPercent + '%' }">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>
									<div class="star-ratings-base">
										<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
									</div>	
								</div>
								<div style="width: 85%;">
									몇점
								</div>	
						</div>
						<div>
							선택 객실
						</div>
						<div>
							리뷰내용이에요~
							어떻게 이럴 수 있는지 정말 좋더라구요.
						</div>
						<div>
							날짜
						</div>
						
							<div class="host_modal">
								<div>
									<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='1' title="좋아요"><i class="bi bi-hand-thumbs-up"></i> <span>${vo.likeCount}</span></button>
									<button type='button' class='btn btn-light btnSendReplyLike' data-replyNum='${vo.replyNum}' data-replyLike='0' title="싫어요"><i class="bi bi-hand-thumbs-down"></i> <span>${vo.disLikeCount}</span></button>	        
								</div>
							</div>
						
						
						
						<div class="mt-2 d-flex room_review">
							<div class="tm_wid8">
								<div>
									<i class="fa-solid fa-building-user"></i>
								</div>
								<div>
									OOO
								</div>
							</div>
							<div class="tm_wid92">
								<div>제휴점 답변</div>
								<div>답변 내용 답변 내용</div>		
								<div>시간</div>						
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		
		
	</div>
</div>


<script type="text/javascript">

/*
ratingToPercent() {
    const score = +this.restaurant.averageScore * 20;
    return score + 1.5;
}
*/




$("input[name=rating]").click(function() {
    	var rating = $(this).val();
	alert(rating);
    
    $('#rating_result').text(rating);
    $('input[name=reviewrating]').val(rating);
    
  });	



// 날짜 구하기
var date = new Date();

var year = date.getFullYear();
var month = ('0' + (date.getMonth() + 1)).slice(-2);
var day = ('0' + date.getDate()).slice(-2);

var today =  year + '-' + month  + '-' + day;

console.log(today);

var today = function() {
  document.write(today);
};



// 숙박인원
function goReservation() {
    location.href = "${pageContext.request.contextPath}/reservation/reservation";
}

$("select[name=sel_people]").on("change", function(){
    var $addr = $(this).closest(".peopleform").find("input[name=input_people]");
    if ($(this).val() == "etc") {
        $addr.val('');
        $addr.prop("readonly",false);

    } else {
        $addr.val($(this).val());
        $addr.prop("readonly",true);
    }
});


// 달력

$('#roomDate').daterangepicker({
	
    "locale": {
        "format": "YYYY-MM-DD",
        "separator": " ~ ",
        "applyLabel": "적용",
        "cancelLabel": "취소",
        "fromLabel": "From",
        "toLabel": "To",
        "customRangeLabel": "Custom",
        "weekLabel": "W",
        "daysOfWeek": [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ],
        "monthNames": [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월"
        ],
        "firstDay": 1
    },
    "alwaysShowCalendars": false,
    "startDate": "${startDate}",
    "endDate": "${endDate}",
    "minDate": moment()
}, function(start, end, label) {
  console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
});
  
$("#roomDate").on('show.daterangepicker', function (ev, picker) {
      $(".yearselect").css("float", "left");
      $(".monthselect").css("float", "right");
      $(".cancelBtn").css("float", "right");
});

$("#roomDate").change(function(){
	var ciDate = $(this).val().substr(0, 10);
	var coDate = $(this).val().substr(13, 10);
	
	alert(ciDate + "," + coDate);	
});
  
  
  
  
// 슬라이더
$('.slider > .pages > div').click(function() {
    var $this = $(this);
    var $slider = $this.closest('.slider');
    
    $this.addClass('active');
    $this.siblings('.active').removeClass('active');
    
    var index = $this.index();
    
    $slider.find(' > .slides > .active').removeClass('active');
    $slider.find(' > .slides > div').eq(index).addClass('active');
});


$('.slider > .side-btns > div').click(function() {
    var $this = $(this);
    var index = $this.index();
    var $slider = $this.closest('.slider');
    
    var $current = $slider.find('.pages > div.active');
    var $post;
    
    if ( index == 0 ) {
        $post = $current.prev();
    }
    else {
        $post = $current.next();
    }
    
    if ( $post.length == 0 ) {
        if ( index == 0 ) {
            $post = $slider.find('.pages > div:last-child');
        }
        else {
            $post = $slider.find('.pages > div:first-child');
        }
    }
    
    $post.click();
});


  
</script>
