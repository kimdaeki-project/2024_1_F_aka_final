

<div class="row">
    <div class="col-md-6 col-lg-4 mb-3">
        <form action="crateStamp" method="post" enctype="multipart/form-data">
        <div class="card h-100">
                <input type="file" multiple accept="image/*" name="img"/>            
                <div class="card-body">
                    <h1 class="card-title">도장등록</h1>
                    <input type="hidden" name="member_Id" value="${member.member_id}">
                    <p class="card-text">
                        
                    </p>
                   <button type="submit" class="btn btn-primary">
                </div>
            </div>
        </form>
    </div>
</div>