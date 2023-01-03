<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class AdminJoinUsMail extends Mailable
{
    use Queueable, SerializesModels;
    public $AdminDetails;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($AdminDetails)
    {
        $this->AdminDetails = $AdminDetails;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Affiliate program join us request on tripplnr.com')->view('emails.adminJoinUs');
    }
}
