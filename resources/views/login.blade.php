@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Dashboard</div>

                <form method="POST">
                    {{ csrf_field() }}

                    <div class="card-body">
                        <input placeholder="Secret Password" type="password" name="password" style="padding: 5px" />
                    </div>

                    <div class="card-body">
                        <button type="submit">LOGIN</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
@endsection
