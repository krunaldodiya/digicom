<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserProfile extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'name' => 'required|min:3',
            'dob' => 'required|size:10',
            'gender' => 'required',
            'marital_status' => 'required',
            'education' => 'required',
            'occupation' => 'required|min:3',
            'father_city' => 'required|min:3',
            'mother_city' => 'required|min:3',
        ];
    }
}
