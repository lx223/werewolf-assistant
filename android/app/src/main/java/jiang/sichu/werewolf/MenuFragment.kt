package jiang.sichu.werewolf

import android.app.AlertDialog
import android.app.Dialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import jiang.sichu.werewolf.proto.Werewolf.CreateAndJoinRoomRequest
import jiang.sichu.werewolf.proto.Werewolf.JoinRoomRequest
import kotlinx.android.synthetic.main.dialog_join_room.*
import kotlinx.android.synthetic.main.fragment_menu.view.*

class MenuFragment : BaseFragment() {

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?,
                              savedInstanceState: Bundle?): View? {
        val view = inflater.inflate(R.layout.fragment_menu, container, false)
        view.btn_create_room.setOnClickListener { createAndJoinRoom() }
        view.btn_join_room.setOnClickListener { showJoinRoomDialog() }
        return view
    }

    private fun createAndJoinRoom() {
        executor?.execute {
            val request = CreateAndJoinRoomRequest.newBuilder().build()
            val response = gameService?.createAndJoinRoom(request)!!
            activity?.onCreateRoomSuccess(response.roomId, response.userId)
        }
    }

    private fun showJoinRoomDialog() {
        AlertDialog.Builder(context)
                .setTitle(R.string.dialog_title_join_room)
                .setView(R.layout.dialog_join_room)
                .setPositiveButton(
                        R.string.btn_label_confirm,
                        { dialog, _ -> joinRoom((dialog as Dialog).room_id_input.text.toString()) })
                .show()
    }

    private fun joinRoom(roomId: String) {
        executor?.execute {
            val request = JoinRoomRequest.newBuilder().setRoomId(roomId).build()
            val response = gameService?.joinRoom(request)!!
            activity?.onJoinRoomSuccess(roomId, response.userId)
        }
    }
}
